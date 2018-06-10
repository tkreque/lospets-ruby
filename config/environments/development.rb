Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true

  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.assets.debug = true
  config.assets.quiet = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { :host => "https://homologation.los-pets.com"}
  config.action_mailer.smtp_settings = {
   :address              => ENV['GMAIL_SMTP'],
   :port                 => 587,
   :user_name            => ENV['GMAIL_USER'],
   :password             => ENV['GMAIL_PASS'],
   :authentication       => "plain",
   :enable_starttls_auto => true
  }
  
end
