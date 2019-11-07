-brand = paste

## Nav

nav =
  .new = New
  .about = About
  .log-in = Log in
  .log-out = Log out
  .register = Register
  .settings = Settings
  .admin = Admin
  .swap-theme = Swap theme

## Footer

footer-code = code
# $version (string) version of the server
footer-server-version = server: {$version}
# $version (string) version of the resources
footer-resources-version = resources: {$version}
footer-credits = credits

## Avatar

# $username (string) username associated with the avatar
avatar-alt = {$username} avatar

## Home

new = New
new-paste = New paste
new-paste-desc = Create a new paste.

## Paste attributes

paste-name = Paste name
  .placeholder = Paste name
paste-description = Description
  .placeholder = Paste description
paste-visibility = Visibility
  .public = public
  .public-desc = {paste-visibility.public} - visible to search engines and shows on your public profile
  .unlisted = unlisted
  .unlisted-desc = {paste-visibility.unlisted} - hidden from search engines and only those with the link can view
  .private = private
  .private-desc = {paste-visibility.private} - only visible to you when logged in
paste-expires = Expires
  .no = no
  .relative = relative
  .absolute = absolute

paste-absolute-expiry =
  .date = Expiry date
  .time = Expiry time
  .timezone = Expiry timezone

paste-relative-expiry =
  .years = Years
  .days = Days
  .hours = Hours
  .minutes = Minutes

## Antispam

# $a (number) first number to add
# $b (number) second number to add
antispam-math = What is {$a} + {$b}?
  .why = Why?
  .description = Since you're not using JavaScript, {-brand} requires you to answer this simple math question to foil simple bots. {-brand} has an API if you're trying to do legitimate things!
  .placeholder = Answer

antispam-honeypot =
  .email = Email
  .title = Title
  .error = An error occurred. Please try again.

## Paste UI

paste-add-file = Add file
paste-submit-anonymous = Submit anonymously
paste-submit = Submit

## Paste display

disp-untitled = untitled paste
# $files (number) number of files the paste has
disp-num-files = {$files} {$files ->
  [one] file
 *[other] files
}
# put directly before the paste expiration date
# rendered, it ends up like "expires in 10 minutes"
disp-expires = expires

disp-tab-files = files
disp-tab-revisions = revisions

disp-delete-title = Delete paste
disp-delete-description = To delete an anonymous paste, you need to use its deletion key. Enter it below and click "{disp-delete-button}" to delete this paste.
disp-delete-key-placeholder = Deletion key
disp-delete-button = Delete
disp-delete-confirm = Please confirm you would like to delete this paste.

disp-dkey-title = Deletion key
disp-dkey-msg-1 = In order to delete this paste, you will need to use the key below. This message will only appear once.
disp-dkey-msg-2 = Note that this key is saved on <em>this browser only</em> for 30 days. If you clear the cache, the key will be lost.

disp-file-tab-rendered = Rendered
disp-file-tab-source = Source
disp-file-raw = Raw
disp-file-binary-content = Binary content

## Revisions

revisions-page-title =
  .named = Revisions for {$name}
  .unnamed = Revisions for {disp-untitled}

revisions-title =
  .named = Revisions for <span class="keeps-spaces">{$name}</span>
  .unnamed = Revisions for <em>{disp-untitled}</em>

revisions-subtitle = View the changes made to this paste.

revisions-unknown-file = unknown file

## Edit

edit-page-title =
  .named = Edit {$name}
  .unnamed = Edit {disp-untitled}

edit-title =
  .named = Edit <span class="keeps-spaces">{$name}</span>
  .unnamed = Edit <em>{disp-untitled}</em>

edit-subtitle = Change this paste<span class="requires-js"> and its files</span>.

## User page

# $name (string) user's name
user-title = {$name}'s pastes
# $pastes (number) number of pastes the user has
user-num-pastes = {$pastes} {$pastes ->
  [one] paste
 *[other] pastes
}
# $name (string) user's name
user-no-pastes = It looks like {$name} has no pastes!

user-delete-selected = Delete selected
user-delete = Delete pastes
  .body = Please confirm you would like to delete the selected pastes.
  .button = Delete all

user-select = Select
  .all = All
  .none = None

## Pagination

pagination =
  .next = Next
  .previous = Previous

## File attributes

file-name-placeholder = File name with extension
file-language = Highlight language
file-language-auto = auto
file-hello-world = Hello world!

## About

about-title = About
# $siteName (string) name of this paste instance
about-blurb =
  .before = {$siteName} runs on
  .paste = {-brand}
  .after = , an open-source project dedicated to making a sensible, modern pastebin that anyone can host.

## Log in

login = Log in
  .description = Log in to your account.

login-username = Username
  .placeholder = jimbo123

login-password = Password
  .placeholder = Your secure password

login-2fa = 2FA code
  .placeholder = Generated code or backup code

login-forgot-password = Forgot your password?

login-submit = Log in

login-error =
  .username = Username not found.
  .password = Incorrect password.
  .tfa = Incorrect authentication code.
  .rate-limit = Please try again in {$minutes} {$minutes ->
    [one] minute
   *[other] minutes
  }.
  .rate-limit-soon = Please try again in a few seconds.

## Register

register = Register
  .description = Create a new account.

register-display-name = Display name
  .placeholder = Jim Bob Jones

register-username = Username
  .placeholder = jimbo123

register-password = Password
  .placeholder = Something really secure, please <3

register-password-again = Password (again)
  .placeholder = What you typed above

register-email = Email
  .placeholder = your@email.com

register-submit = Submit

register-error =
  .empty-fields = No fields can be empty.
  .closed = Registration is not open and that email address is not whitelisted.
  .duplicate-email = A user with that email address already exists.

## Forgot password

forgot = Forgot password
  .description = Start the password reset process.

forgot-email = Email
  .placeholder = your@email.com

forgot-submit = Submit

## Reset password

reset = Reset password
  .description = Reset your password here.

reset-password = Password
  .placeholder = Something really secure, please <3

reset-password-again = Password (again)
  .placeholder = What you typed above

reset-submit = Submit

reset-error =
  .bad-url = Invalid password reset URL.
  .bad-reset = Invalid password reset.
  .missing-account = That account does not exist.

reset-success =
  .email = If an account has a verified email address of {$email}, a password reset email was sent to it.
  .reset = Password updated.

## Settings

settings-tabs =
  .settings = Settings
  .api-keys = API keys
  .two-factor = 2FA
  .delete = Delete

## Account

account = Account
  .description = Manage account settings.

email-not-verified = Your email is not verified!
  .body = Click the button below to resend a verification email.
  .button = Send verification email

account-display-name = Display name

account-username = Username
  .help = Changing your username will invalidate all links with your username in them.

account-avatar = Avatar
  .help = Your avatar is determined using an avatar provider linked to your email address. Changes can be made to your avatar at whichever provider you have chosen.

account-avatar-provider = Avatar provider
  .link = link

account-email = Email

account-change-password = Change password
  .help = Leave this blank to keep your password the same.

account-change-password-again = Change password (again)

account-current-password = Current password
  .help = Required to change any information.

account-submit = Change

email-verify-error =
  .already-verified = Your email is already verified.
  .resend-too-soon = You must wait 15 minutes between vertification email resends.
  .invalid = Invalid email verification.

email-verify-sent = Email sent.

email-verify-success = Email verified.

account-error =
  .current-empty = Current password cannot be empty.
  .invalid-email = Invalid email.
  .invalid-display-name = Invalid display name: {$err}.
  .invalid-username = Invalid username: {$err}.
  .duplicate-username = A user with that username already exists.
  .new-password-different = New passwords did not match.
  .new-password-too-short = New password must be at least 10 characters long.
  .new-password-invalid = New password cannot be your name, user, email, or "password".

account-success = Account updated.

## API keys

api-keys = API keys
  .description = Manage API keys.

api-keys-table-header =
  .name = Name
  .key = Key

api-keys-no-keys = You have no keys!

api-key-add =
  .name-placeholder = Key name
  .submit = Add

api-key-error =
  .empty-name = API key name cannot be empty.

## Delete account

delete-account = Delete account
  .description = Delete your account here.

delete-account-warning = Whoa there!
  .line-1 = Please take the time to read this text!
  .line-2 = Deleting your account is <em>instantaneous and permanent</em>. All of your pastes will immediately cease being accessible and will eventually be deleted off of the server by a task.
  .line-3 = If you really want to delete your account, type your password in the box below and click the button. You will be redirected to the home page after your account is deleted.

delete-account-password = Your secure password
  .help = Type your password to confirm account deletion.

delete-account-submit = Delete my account

## 2FA

tfa = 2FA
  .description = Manage two-factor authentication.

tfa-backup = Backup codes
  .body-1 = If you ever lose access to your 2FA device, you can use these codes instead of a generated code to access your account. Each code can only be used once. They will only be displayed once, so don't lose them!
  .body-2 = You can generate new codes at any time while logged in. Use the button below to do so.

tfa-new-backup = Generate new backup codes

tfa-enabled = 2FA is enabled.
tfa-disabled = 2FA is not enabled.

tfa-turn-off = Turn off 2FA
tfa-turn-on = Turn on 2FA

tfa-explanation =
  .part-1 = Two-factor authentication (a form of <a class="external" target="_blank" href="https://en.wikipedia.org/wiki/Multi-factor_authentication">multi-factor authentication</a>) increases the security of your account by requiring you to specify a one-time password generated by another device on login.
  .part-2 = This feature requires a smart device or smart card and an app to generate the codes. For Android and iOS devices, see the table below.

tfa-devices =
  .play-store = Android (Play Store)
  .ios = iOS (App Store)
  .fdroid = Android (F-Droid)

tfa-error =
  .already-enabled = 2FA is already enabled on your account.
  .not-enabled = 2FA is not enabled on your account.
  .missing-secret = No shared secret has been generated yet.

## Enable 2FA

tfa-enable = Enable 2FA
  .description = Turn on two-factor authentication.

tfa-enable-scan-qr = Scan the QR code below using your authenticator app. If you can't scan the code, you can enter the shared secret manually, <strong>without spaces</strong>:

tfa-enable-new-secret = If you want to generate a new shared secret, click the button below.
  .button = Regenerate secret

tfa-enable-enter-code = After setting up the authenticator app, enter the code it has generated below.
  .placeholder = 2FA code
  .button = Enable

## Disable 2FA

tfa-disable = Disable 2FA
  .description = Turn off two-factor authentication.

tfa-disable-warning = Turning off 2FA will lower the security of your account. If you'd still like to disable it, enter your password below.

tfa-disable-password =
  .placeholder = Your secure password
  .button = Disable

## Credits

credits = Credits
  .description = If {-brand} was a movie, these would be at the end.

## Errors

error-400 = Bad request.
  .description = You made an incorrect request.

error-403 = Forbidden.
  .description = You're not allowed to see or do whatever it was you were trying to see or do.

error-404 = Page not found.
  .description = We couldn't find what you're looking for. Sorry!

error-500 = Internal server error.
  .description = Otherwise known as "we goofed." This is always a bug, so feel free to <a href="https://github.com/jkcclemens/paste/issues/new?title=500%20on%20%3Croute%3E&body=So%20I%20was%20trying%20to%20go%20to%20%3Croute%3E,%20but%20then%20the%20server%20was%20all%20like%20nah,%20bb,%20500!">report it!</a>

error-other = Error.
  .description = You got some strange error.

error-csrf = Invalid anti-CSRF token.

## Admin

admin-success = You are now an admin.

## Admin errors

admin-no-key = No admin key is set.
admin-bad-key = Incorrect key.
admin-already-admin = You're already an admin.
admin-exists = You cannot become an admin this way if admins already exist.

## Admin nav

admin-tabs =
  .overview = Overview
  .pastes = Pastes
  .users = Users
  .config = Config
  .maintenance = Maintenance

## Admin overview

admin-overview =
  .title = Admin
  .subtitle = Perform administration tasks.

admin-stats =
  .pastes = Pastes
  .users = Users

## Admin pastes

admin-pastes =
  .title = Pastes
  .subtitle = Manage all pastes.

admin-pastes-list-headers =
  .link = Link
  .name = Name
  .description = Description
  .visibility = Visibility
  .author = Author
  .files = Files
  .created = Created
  .expires = Expires
  .actions = Actions

admin-pastes-list =
  .anonymous = anonymous
  .empty = empty
  .never = never

admin-paste-delete =
  .success = Paste deleted.
  .missing = Could not find that paste. Was it already deleted?

admin-paste-delete-modal =
  .title = Delete paste as admin
  .confirm = Please confirm you would like to delete this paste as an admin.
  .button = Delete as admin

admin-batch-delete = Batch delete
  .desc = Insert paste IDs or URLs, one per line, to delete.
  .placeholder = Paste IDs or URLs, one per line
  .button = Delete
  .error = Could not delete <code>{$id}</code>: {$error}.
  .success = Deleted {$pastes} {$pastes ->
    [one] paste
   *[other] pastes
  }.

admin-batch-delete-missing = could not find paste

admin-batch-delete-bad-id = Invalid ID: {$err}.

## Admin users

admin-users =
  .title = Users
  .subtitle = Manage all users.

admin-users-table =
  .name = Name
  .username = Username
  .email = Email
  .email-verified = Email verified
  .tfa-enabled = 2FA enabled
  .admin = Admin
  .actions = Actions

admin-users-yes-no =
  .yes = Yes
  .no = No

admin-users-admin =
  .super = super
  .normal = admin
  .none = none

admin-users-delete =
  .missing = No such user.
  .success = User deleted.
  .super = Cannot delete a super admin.
  .other-admin = Cannot delete another admin.

admin-users-delete-modal =
  .title = Delete user
  .confirm = Please confirm you would like to delete this user.
  .button = Delete

admin-users-promote-modal =
  .title = Promote <em>{$user}</em>
  .line-1 = What level of admin do you want to promote <em>{$user}</em> to?
  .superadmin = Superadmin
  .superadmin-desc = Superadmins cannot be deleted and can change other users' admin status. They
                     are able to control everything.
  .superadmin-warning = <strong class="has-text-danger">Important</strong>: The only way to demote a
                        superadmin is to access the database directly.
  .admin = Admin
  .admin-desc = Admins can be deleted and cannot control other users' admin status. Admins cannot
                delete other admins.
  .button = Promote

admin-users-demote-modal =
  .title = Demote <em>{$user}</em>
  .desc = Demoted users become normal users with no admin privileges.
  .button = Demote

admin-users-status =
  .must-be-super = You must be a superadmin to promote/demote users.
  .missing = No such user.
  .target-super = You cannot promote/demote a superadmin.
  .already-admin = That user is already an admin.
  .not-admin = That user is not an admin.
  .promoted = User successfully promoted.
  .demoted = User successfully demoted.
  .invalid-level = Invalid admin level.

## Admin config

admin-config =
  .title = Config
  .subtitle = Edit the site configuration.

admin-config-save = Save

## CSV

csv-error =
  .utf-8 = {-brand} would like to show you this CSV file as a table, but it couldn't be read as valid UTF-8: {$err}.
  .utf-8-pos = {-brand} would like to show you this CSV file as a table, but it couldn't be read as valid UTF-8 at line {$line} (byte {$byte}): {$err}.
  .lengths = {-brand} would like to show you this CSV file as a table, but it has a row with {$secondRowFields} {$secondRowFields ->
    [one] field
   *[other] fields
  } while the previous row had {$firstRowFields} {$firstRowFields ->
    [one] field
   *[other] fields
  }.
  .lengths-pos = {-brand} would like to show you this CSV file as a table, but it has a row with {$secondRowFields} {$secondRowFields ->
    [one] field
   *[other] fields
  } (line {$line}, byte {$byte}) while the previous row had {$firstRowFields} {$firstRowFields ->
    [one] field
   *[other] fields
  }.
