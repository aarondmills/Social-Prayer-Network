# config/initializers/setup_mail.rb
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "jailbreakcreative.com",
  :user_name            => "aaron@jailbreakcreative.com",
  :password             => "enNaKpmK",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

