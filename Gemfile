source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap-kaminari-views"
gem "bootstrap-sass", "3.3.7"
gem "carrierwave"
gem "ckeditor"
gem "closure_tree"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "devise"
gem "faker"
gem "koala"
gem "selectize-rails"
gem "figaro"
gem "fog"
gem "toastr-rails"
gem "font-awesome-rails"
gem "i18n-js"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "kaminari"
gem "omniauth"
gem "omniauth-facebook"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.2"
gem "rails-i18n", "~> 5.1"
gem "ransack"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "slim"
gem "social-share-button"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem 'jquery-ui-rails'

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem 'rails-erd'
  gem "rails-controller-testing"
end

group :development do
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "database_cleaner"
  gem "guard-rspec"
  gem "launchy"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "shoulda-matchers", "~> 3.1"
  gem "spring"
  gem "capybara", ">= 2.15"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :production do
  gem "pg"
  gem "rails_12factor", "0.0.2"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "selenium-webdriver"
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem "chromedriver-helper"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
