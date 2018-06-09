Recaptcha.configure do |config|
  config.site_key  = ENV['RECAPTCHA']
  config.secret_key = ENV['RECAPTCHA_SECRET']
end