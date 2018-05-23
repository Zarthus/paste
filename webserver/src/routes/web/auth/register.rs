use config::Config;
use database::DbConn;
use database::models::users::{User, NewUser};
use database::schema::users;
use errors::*;
use models::id::UserId;
use routes::web::{context, Rst, OptionalWebUser, Session};
use utils::{email, ReCaptcha, HashedPassword, Validator};

use chrono::Utc;

use cookie::{Cookie, SameSite};

use diesel;
use diesel::dsl::count;
use diesel::prelude::*;

use rocket::State;
use rocket::http::Cookies;
use rocket::request::Form;
use rocket::response::Redirect;

use rocket_contrib::Template;

use sidekiq::Client as SidekiqClient;

use unicode_segmentation::UnicodeSegmentation;

use uuid::Uuid;

#[get("/register")]
fn get(config: State<Config>, user: OptionalWebUser, mut sess: Session) -> Rst {
  if user.is_some() {
    return Rst::Redirect(Redirect::to("/"));
  }
  let ctx = context(&*config, user.as_ref(), &mut sess);
  Rst::Template(Template::render("auth/register", ctx))
}

#[derive(Debug, FromForm)]
struct RegistrationData {
  name: String,
  username: String,
  email: String,
  password: String,
  password_verify: String,
  #[form(field = "g-recaptcha-response")]
  recaptcha: ReCaptcha,
  anti_csrf_token: String,
}

#[post("/register", format = "application/x-www-form-urlencoded", data = "<data>")]
fn post(data: Form<RegistrationData>, mut sess: Session, mut cookies: Cookies, conn: DbConn, config: State<Config>, sidekiq: State<SidekiqClient>) -> Result<Redirect> {
  let data = data.into_inner();

  if !sess.check_token(&data.anti_csrf_token) {
    sess.add_data("error", "Invalid anti-CSRF token.");
    return Ok(Redirect::to("/register"));
  }

  if data.username.is_empty() || data.name.is_empty()  || data.email.is_empty() || data.password.is_empty() {
    sess.add_data("error", "No fields can be empty.");
    return Ok(Redirect::to("/register"));
  }
  let username = match Validator::validate_username(&data.username) {
    Ok(u) => u,
    Err(e) => {
      sess.add_data("error", format!("Invalid username: {}.", e));
      return Ok(Redirect::to("/register"));
    },
  };
  let display_name = match Validator::validate_display_name(&data.name) {
    Ok(d) => d.into_owned(),
    Err(e) => {
      sess.add_data("error", format!("Invalid display name: {}.", e));
      return Ok(Redirect::to("/register"));
    },
  };

  if !email::check_email(&data.email) {
    sess.add_data("error", "Invalid email.");
    return Ok(Redirect::to("/register"));
  }

  if data.password != data.password_verify {
    sess.add_data("error", "Passwords did not match.");
    return Ok(Redirect::to("/register"));
  }

  if data.password.graphemes(true).count() < 10 {
    sess.add_data("error", "Password must be at least 10 characters long.");
    return Ok(Redirect::to("/register"));
  }
  if data.password == data.name || data.password == data.username || data.password == data.email || data.password == "password" {
    sess.add_data("error", r#"Password cannot be the same as your name, username, email, or "password"."#);
    return Ok(Redirect::to("/register"));
  }

  if !data.recaptcha.verify(&config.recaptcha.secret_key)? {
    sess.add_data("error", "The captcha did not validate. Try again.");
    return Ok(Redirect::to("/register"));
  }

  let existing_names: i64 = users::table
    .filter(users::username.eq(&username))
    .select(count(users::id))
    .get_result(&*conn)?;
  if existing_names > 0 {
    sess.add_data("error", "A user with that username already exists.");
    return Ok(Redirect::to("/register"));
  }

  let id = UserId(Uuid::new_v4());

  let nu = NewUser::new(
    id,
    username.into_owned(),
    HashedPassword::from(data.password).into_string(),
    Some(display_name),
    Some(data.email),
  );

  let user: User = diesel::insert_into(users::table)
    .values(&nu)
    .get_result(&*conn)?;

  let ver = user.create_email_verification(&conn, Some(Utc::now().naive_utc()))?;

  sidekiq.push(ver.job(&*config, &user)?.into())?;

  let cookie = Cookie::build("user_id", id.simple().to_string())
    .secure(true)
    .http_only(true)
    .same_site(SameSite::Lax)
    .finish();
  cookies.add_private(cookie);

  Ok(Redirect::to("lastpage"))
}
