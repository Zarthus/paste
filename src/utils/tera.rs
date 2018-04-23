use ammonia;

use pulldown_cmark::{html, Parser};

use rocket_contrib::tera::{Value, Result};

pub fn markdown(value: Value, _: HashMap<String, Value>) -> Result<Value> {
  let s = match value.as_str() {
    Some(x) => x,
    None => return Err(format!("cannot parse markdown on non-strings").into()),
  };

  let mut html = String::with_capacity(s.len());
  html::push_html(&mut html, Parser::new(s));

  let clean = ammonia::clean(&html);

  Ok(Value::String(clean))
}
