# frozen_string_literal: true

FQDN = ENV['FQDN'] || 'dev.recess.is'
FQDN_APP = ENV['FQDN_APP'] || 'dev.recess.is'

SERVER_CONTEXT = (ENV['SERVER_CONTEXT'] || 'development').to_s.downcase
SERVER_NAME = (ENV['SERVER_NAME'] || 'local').to_s.downcase

LIVE_WEB = SERVER_CONTEXT.eql?('live') and SERVER_NAME.eql?('web')

ENV['IN_RAKE']    = 'YES' if $PROGRAM_NAME.end_with?('rake') || File.basename($PROGRAM_NAME).eql?('rake')
ENV['IN_CONSOLE'] = 'YES' if defined?(Rails::Console)
ENV['IN_GENERATOR'] = 'YES' if defined?(Rails::Generators)
ENV['IN_SERVER'] = 'YES' unless ENV['IN_CONSOLE'] || ENV['IN_RAKE'] || ENV['IN_GENERATOR'] || Rails.env.test?
