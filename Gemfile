source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'

gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'jquery-rails'

# MongoDB
gem 'mongoid', github: 'mongodb/mongoid'
gem 'bson_ext'

# Maps
gem 'geocoder'
gem 'gmaps4rails'
gem 'underscore-rails'

# Upload Image
gem 'carrierwave'
gem 'carrierwave-mongoid'
gem "fog-aws"

# Login
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'dotenv'

# Notification
gem 'rpush'
gem 'twilio-ruby'
gem 'textris'
gem 'aws-sdk', '~> 3'

# Share
gem 'social-share-button'

# Other functionalities
gem 'jquery_mask_rails', '~> 0.1.0'
gem "recaptcha", require: "recaptcha/rails"


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
