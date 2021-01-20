# frozen_string_literal: true

class TimeUtil
  # return whether the date is observing daylight savings or is in standard time
  def self.daylight_savings_mode date = Time.now
    day = Time.parse(date.to_s)
    mode = :standard
    mode = :daylight_savings if day.dst?
    mode
  end

  def self.timezone_table_for_utc_offsets_in_hours date = Time.now
    TIMEZONE_TABLE_FOR_UTC_OFFSETS_IN_HOURS[daylight_savings_mode(date)]
  end

  def self.utc_offset_in_hours_for_tz date, timezone
    day = Time.parse(date.to_s)
    mode = :standard
    mode = :daylight_savings if day.dst?
    UTC_OFFSETS_IN_HOURS[timezone.to_s.downcase.to_sym][mode]
  end

  def self.twelve_hour_time_format military_time
    time = military_time
    hour = time[0..1].to_i
    ampm = 'AM'
    if hour > 11
      hour -= 12 unless hour.eql? 12
      minutes = time[-2..-1].to_i
      ampm = 'PM'
      time = format '%02d:%02d', hour, minutes
    end
    time = "#{time} #{ampm}"
  end
end
