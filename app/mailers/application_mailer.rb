# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  layout 'mailer'
  helper :application
end
