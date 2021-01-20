require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RecessMarketplace
  class Application < Rails::Application
    config.load_defaults 5.2 # Initialize configuration defaults for originally generated Rails version.
    # config.mongoid.logger = Logger.new($stdout, :warn)
    Mongoid.logger.level = Logger::WARN
    Mongo::Logger.logger.level = Logger::WARN
    config.action_view.logger = nil
    config.generators.system_tests = nil # Don't generate system test files.

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: :any
      end
    end
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '{*/}')]
    config.autoload_paths += Dir[Rails.root.join('app', 'decorators', '{*/}')]
    config.autoload_paths += Dir[Rails.root.join('app', 'services', '{/**/}')]
    config.autoload_paths += Dir[Rails.root.join('app', 'workers', '{/**/}')]
    config.autoload_paths += Dir[Rails.root.join('app', 'helpers', '{*/}')]
    config.autoload_paths += Dir[Rails.root.join('app', 'queries', '{*/}')]
    config.autoload_paths += Dir[Rails.root.join('app', 'handlers', '{*/}')]
    
    config.action_mailer.default_url_options = { host: ENV["FQDN"] || "localhost:3000" }

    config.action_mailer.delivery_method = :smtp

    if "live".eql? ENV["SERVER_CONTEXT"].to_s.downcase # use sendgrid
      config.action_mailer.default_url_options = { host: 'https://app.recess.is' }
      config.action_mailer.smtp_settings = {
        user_name: ENV["SENDGRID_USERNAME"],
        password: ENV["SENDGRID_PASSWORD"],
        domain: 'recess.is',
        address: 'smtp.sendgrid.net',
        port: "587",
        authentication: :plain,
        enable_starttls_auto: true,
      }
    else # use MailTrap
      config.action_mailer.smtp_settings = {
        :user_name => '6c3b0fadf157df',
        :password => 'c5e49028fcd08f',
        :address => 'smtp.mailtrap.io',
        :domain => 'smtp.mailtrap.io',
        :port => '2525',
        :authentication => :cram_md5
      }
    end

  end
end
