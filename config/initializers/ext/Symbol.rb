# frozen_string_literal: true

class Symbol
  def to_key
    to_s.squish.underscore.gsub('.', '_').gsub(' ', '_').gsub(/_+/, '_')
  end

  def squish
    to_s.squish
  end

  def squish!
    self
  end
  alias squish squish!

  def split(token)
    to_s.split(token)
  end
end
