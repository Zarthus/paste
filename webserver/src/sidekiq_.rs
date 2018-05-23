use errors::*;
use models::id::UserId;
use store::Store;

use serde::Serialize;

use sidekiq::{self, Value, JobOpts};

use std::path::PathBuf;

pub enum Job {
  DeleteAllPastes(UserId),
  Email {
    config_path: PathBuf,
    email: String,
    name: String,
    subject: String,
    content: String,
  },
}

impl Job {
  pub fn email<T, C, P, E, N, S>(template: T, context: C, path: P, email: E, name: N, subject: S) -> Result<Job>
    where T: AsRef<str>,
          C: Serialize,
          P: Into<PathBuf>,
          E: Into<String>,
          N: Into<String>,
          S: Into<String>,
  {
    let rendered = ::EMAIL_TERA
      .render(template.as_ref(), &context)
      .map_err(|e| format_err!("tera error: {}", e))?;

    Ok(Job::Email {
      config_path: path.into(),
      email: email.into(),
      name: name.into(),
      subject: subject.into(),
      content: rendered,
    })
  }

  fn class(&self) -> &str {
    match *self {
      Job::DeleteAllPastes(_) => "DeleteAllPastes",
      Job::Email { .. } => "Email",
    }
  }

  fn args(&self) -> Vec<sidekiq::Value> {
    match *self {
      Job::DeleteAllPastes(u) => {
        let path = Store::directory()
          .canonicalize()
          .expect("could not canonicalize store path")
          .join(u.simple().to_string())
          .to_string_lossy()
          .into_owned();
        vec![
          Value::String(path),
        ]
      },
      Job::Email { ref config_path, ref email, ref name, ref subject, ref content } => vec![
        Value::String(config_path.to_string_lossy().into_owned()),
        Value::String(email.to_string()),
        Value::String(name.to_string()),
        Value::String(subject.to_string()),
        Value::String(content.to_string()),
      ],
    }
  }

  fn opts(&self) -> JobOpts {
    match *self {
      Job::DeleteAllPastes(_) => JobOpts {
        queue: "low".into(),
        .. Default::default()
      },
      Job::Email { .. } => Default::default(),
    }
  }
}

impl From<Job> for sidekiq::Job {
  fn from(j: Job) -> Self {
    sidekiq::Job::new(
      j.class().to_string(),
      j.args(),
      j.opts(),
    )
  }
}
