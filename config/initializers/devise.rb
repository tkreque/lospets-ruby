Devise.setup do |config|
  config.mailer_sender = 'noreply@los-pets.com'
  require 'devise/orm/mongoid'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

# Based on the link https://scotch.io/tutorials/integrating-social-login-in-a-ruby-on-rails-application
  config.omniauth :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'], scope: 'public_profile,email'
  config.omniauth :twitter, ENV['TWITTER_APP_ID'], ENV['TWITTER_APP_SECRET']

end
