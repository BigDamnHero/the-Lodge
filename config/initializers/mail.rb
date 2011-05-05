ActionMailer::Base.smtp_settings = {
  :address => SITE['MAIL_ADDR'] || ENV['MAIL_ADDR'],
  :port => SITE['MAIL_PORT'] || ENV['MAIL_PORT'],
  :domain => SITE['MAIL_DOMAIN'] || ENV['MAIL_DOMAIN'],
  :user_name => SITE['MAIL_USER'] || ENV['MAIL_USER'],
  :password => SITE['MAIL_PASS'] || ENV['MAIL_PASS'],
  :authentication => SITE['MAIL_AUTH'] || ENV['MAIL_AUTH'],
  :enable_starttls_auto => SITE['MAIL_STARTTLS'] || ENV['MAIL_STARTTLS'],
}
