use database::DbConn;
use database::models::deletion_keys::DeletionKey;
use database::models::pastes::Paste as DbPaste;
use database::models::users::User;
use database::schema::{users, deletion_keys};
use errors::*;
use models::id::{DeletionKeyId, PasteId};
use models::paste::Visibility;
use routes::web::{Rst, OptionalWebUser, Session};

use diesel::prelude::*;

use rocket::http::Status as HttpStatus;
use rocket::request::Form;
use rocket::response::Redirect;

use uuid::Uuid;

use std::str::FromStr;

#[delete("/pastes/<username>/<id>", format = "application/x-www-form-urlencoded", data = "<deletion>")]
fn delete(deletion: Form<PasteDeletion>, username: String, id: PasteId, user: OptionalWebUser, mut sess: Session, conn: DbConn) -> Result<Rst> {
  let deletion = deletion.into_inner();

  if !sess.check_token(&deletion.anti_csrf_token) {
    sess.add_data("error", "Invalid anti-CSRF token.");
    return Ok(Rst::Redirect(Redirect::to("lastpage")));
  }

  let paste: DbPaste = match id.get(&conn)? {
    Some(p) => p,
    None => return Ok(Rst::Status(HttpStatus::NotFound)),
  };

  let expected_username: String = match paste.author_id() {
    Some(author) => {
      let user: User = users::table.find(author).first(&*conn)?;
      user.username().to_string()
    },
    None => "anonymous".into(),
  };

  if username != expected_username {
    return Ok(Rst::Status(HttpStatus::NotFound));
  }

  if let Some((status, _)) = paste.check_access(user.as_ref().map(|x| x.id())) {
    return Ok(Rst::Status(status));
  }

  match paste.author_id() {
    Some(author) => if Some(author) != user.as_ref().map(|x| x.id()) {
      if paste.visibility() == Visibility::Private {
        return Ok(Rst::Status(HttpStatus::NotFound));
      } else {
        return Ok(Rst::Status(HttpStatus::Forbidden));
      }
    },
    None => {
      let key = match deletion.key {
        Some(k) => k,
        None => {
          sess.add_data("error", "Anonymous pastes require a deletion key to delete.");
          return Ok(Rst::Redirect(Redirect::to("lastpage")));
        },
      };

      let key = match Uuid::from_str(&key) {
        Ok(k) => DeletionKeyId(k),
        Err(_) => {
          sess.add_data("error", "Invalid deletion key.");
          return Ok(Rst::Redirect(Redirect::to("lastpage")));
        },
      };

      let db_key: DeletionKey = match deletion_keys::table.find(&key).first(&*conn).optional()? {
        Some(k) => k,
        None => {
          sess.add_data("error", "Invalid deletion key.");
          return Ok(Rst::Redirect(Redirect::to("lastpage")));
        },
      };

      if db_key.paste_id() != paste.id() {
        sess.add_data("error", "Invalid deletion key.");
        return Ok(Rst::Redirect(Redirect::to("lastpage")));
      }
    },
  }

  // should be authed beyond this point

  paste.delete(&conn)?;

  sess.add_data("info", "Paste deleted.");
  Ok(Rst::Redirect(Redirect::to("/")))
}

#[derive(Debug, FromForm)]
struct PasteDeletion {
  key: Option<String>,
  anti_csrf_token: String,
}
