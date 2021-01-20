# frozen_string_literal: true

module ApplicationHelper
  def client_app_url path = ''
    p = path
    p = "/#{path}" if path.length.positive? && !path[0].eql?('/')
    "https://#{FQDN_APP}#{p}"
  end

  def truncate_text text, length = 150
    return text if length > text.length

    "#{text[0..(length - 1)]}..."
  end

  def supplier_events_index_url_helper
    root_recess_supply_app = ROOT_RECESS_SUPPLY_APP || 'https://app.recess.is'
    "#{root_recess_supply_app}/events"
  end

  def us_timezone_options
    options = []
    US_TIMEZONES.each do |tz|
      options.push({ id: tz.to_s.downcase, name: tz })
    end
    options
  end

  def day_time_options
    [
      { id: '00:30 AM', name: '12:30 AM'},
      {id: '1:00 AM', name: '1:00 AM'},
      {id: '1:30 AM', name: '1:30 AM'},
      {id: '2:00 AM', name: '2:00 AM'},
      {id: '2:30 AM', name: '2:30 AM'},
      {id: '3:00 AM', name: '3:00 AM'},
      {id: '3:30 AM', name: '3:30 AM'},
      {id: '4:00 AM', name: '4:00 AM'},
      {id: '4:30 AM', name: '4:30 AM'},
      {id: '5:00 AM', name: '5:00 AM'},
      {id: '5:30 AM', name: '5:30 AM'},
      {id: '6:00 AM', name: '6:00 AM'},
      {id: '6:30 AM', name: '6:30 AM'},
      {id: '7:00 AM', name: '7:00 AM'},
      {id: '7:30 AM', name: '7:30 AM'},
      {id: '8:00 AM', name: '8:00 AM'},
      {id: '8:30 AM', name: '8:30 AM'},
      {id: '9:00 AM', name: '9:00 AM'},
      {id: '9:30 AM', name: '9:30 AM'},
      {id: '10:00 AM', name: '10:00 AM'},
      {id: '10:30 AM', name: '10:30 AM'},
      {id: '11:00 AM', name: '11:00 AM'},
      {id: '11:30 AM', name: '11:30 AM'},
      {id: '12:00 PM', name: '12:00 PM Noon'},
      {id: '12:30 PM', name: '12:30 PM'},
      {id: '1:00 PM', name: '1:00 PM'},
      {id: '1:30 PM', name: '1:30 PM'},
      {id: '2:00 PM', name: '2:00 PM'},
      {id: '2:30 PM', name: '2:30 PM'},
      {id: '3:00 PM', name: '3:00 PM'},
      {id: '3:30 PM', name: '3:30 PM'},
      {id: '4:00 PM', name: '4:00 PM'},
      {id: '4:30 PM', name: '4:30 PM'},
      {id: '5:00 PM', name: '5:00 PM'},
      {id: '5:30 PM', name: '5:30 PM'},
      {id: '6:00 PM', name: '6:00 PM'},
      {id: '6:30 PM', name: '6:30 PM'},
      {id: '7:00 PM', name: '7:00 PM'},
      {id: '7:30 PM', name: '7:30 PM'},
      {id: '8:00 PM', name: '8:00 PM'},
      {id: '8:30 PM', name: '8:30 PM'},
      {id: '9:00 PM', name: '9:00 PM'},
      {id: '9:30 PM', name: '9:30 PM'},
      {id: '10:00 PM', name: '10:00 PM'},
      {id: '10:30 PM', name: '10:30 PM'},
      {id: '11:00 PM', name: '11:00 PM'},
      {id: '11:30 PM', name: '11:30 PM'},
      {id: '11:59 PM', name: 'Midnight'}
    ]
  end

  def repeat_frequency_options
    [
      {id: :one_time_only, name: 'One Time Only'},
      {id: :annually, name: 'Every Year'},
      {id: :monthly, name: 'Every Month'},
      {id: :weekly, name: 'Every Week'},
      {id: :daily, name: 'Every Day'},
      {id: :every_fall, name: 'Every Fall'},
      {id: :every_spring, name: 'Every Spring'},
      {id: :every_fall_and_every_spring, name: 'Every Fall and Every Spring'},
      {id: :unknown, name: "I don't know"},
      {id: :other, name: :Other}
    ]
  end

  def supplier_login_url_helper
    'https://app.recess.is/users/sign_in'
  end

  def supplier_registration_url_helper
    'https://app.recess.is/users/sign_up'
  end

  def blog_url_helper
    'https://medium.com/@RECESS'
  end

  def facebook_page_url_helper
    'https://www.facebook.com/recess.is'
  end

  def instagram_page_url_helper
    'https://www.instagram.com/recess'
  end

  def instagram_page_url_helper
    'https://instagram.com/recess'
  end
end
