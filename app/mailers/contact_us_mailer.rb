class ContactUsMailer < ApplicationMailer

  def send_message params, recipients='jack@recess.is, deuce@recess.is, product@recess.is'
    subject = "#{params[:subject]} - WEB CONTACT US"
    @from_email = params[:from_email]
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @org_name = params[:org_name]
    @phone = params[:phone]
    @body = params[:message]
    mail(to: recipients, subject: subject)
  end

end