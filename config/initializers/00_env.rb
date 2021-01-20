FQDN = ENV['FQDN'] || "dev.recess.is"
FQDN_APP = ENV['FQDN_APP'] || "dev.recess.is"

SERVER_CONTEXT = (ENV["SERVER_CONTEXT"] || "development").to_s.downcase
SERVER_NAME = (ENV["SERVER_NAME"] || "local").to_s.downcase

LIVE_WEB = SERVER_CONTEXT.eql?("live") and SERVER_NAME.eql?("web")

ENV["IN_RAKE"]    = "YES" if $0.end_with?("rake") || File.basename($0).eql?("rake")
ENV["IN_CONSOLE"] = "YES" if defined?(Rails::Console)
ENV["IN_GENERATOR"] = "YES" if defined?(Rails::Generators)
ENV["IN_SERVER"]  = "YES" unless (ENV["IN_CONSOLE"] or ENV["IN_RAKE"] or ENV["IN_GENERATOR"] or Rails.env.test?)
