# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Admin
# https://github.com/thoughtbot/administrate
# https://github.com/sferik/rails_admin

# Search
# https://github.com/activerecord-hackery/ransack-mongoid

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'mongoid', '~> 7.0'
gem 'mongoid-geospatial'
gem 'mongoid_rails_migrations'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.2'
gem 'sass-rails', '~> 5.0'
gem 'slim', '~> 4.0.1'
gem 'uglifier', '>= 1.3.0'
# gem 'webpacker', '~> 3.5.5'
gem 'rack-cors', '~> 1.0.3'

gem 'bcrypt', '~> 3.1.12'
gem 'dotenv-rails', '~> 0.7.0'
gem 'draper', '~> 3.0.1'
gem 'foreman', '~> 0.64.0'
gem 'gon', '~> 6.2.1'

gem 'bootstrap', '~> 4.3.1'
gem 'bootstrap_form', '~> 4.2.0'
gem 'coffee-rails', '~> 4.2'
gem 'font-awesome-rails', '~> 4.7.0'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'

gem 'httparty'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '~> 3.29.0'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec_junit_formatter'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webdrivers', '~> 4.1.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
