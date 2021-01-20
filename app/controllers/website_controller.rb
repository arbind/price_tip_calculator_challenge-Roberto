# frozen_string_literal: true

class WebsiteController < ApplicationController
  layout 'website/page'
  before_action :hide_navbar_links, only: %i[choose_sign_in choose_registeration schedule_demo tos privacy sponsor_tos org_tos sponsor_cancellation_policy organizer_cancellation_policy announcement_new_platform_launch]
  before_action :set_as_supply_page, only: [:for_events]

  def home; end

  def contact_us; end

  def for_events; end

  def choose_sign_in; end

  def choose_registeration; end

  def schedule_demo
    @hide_footer = true
  end

  def tos; end

  def privacy; end

  def sponsor_tos; end

  def org_tos; end

  def sponsor_cancellation_policy; end

  def organizer_cancellation_policy; end

  def announcement_new_platform_launch; end

  def send_message
    ContactUsMailer.send_message(message_params).deliver
    flash[:notice] = 'Thanks, your message has been sent!'
    redirect_to :contact_us
  end

  private

  def message_params
    params.require(:message).permit(:from_email, :subject, :message, :first_name, :last_name, :org_name, :phone)
  end

  def hide_navbar_links
    @hide_navbar_links = true
  end

  def set_as_supply_page
    @is_supply_page = true
  end
end
