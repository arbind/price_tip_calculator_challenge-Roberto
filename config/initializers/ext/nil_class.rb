# frozen_string_literal: true

class NilClass
  def empty?
    true
  end

  def to_boolean
    false
  end
  alias to_bool to_boolean

  def to_sym
    self
  end

  def compact
    self
  end

  def to_key
    self
  end

  def strip!
    self
  end
  alias strip strip!

  def squish!
    self
  end
  alias squish squish!

  def downcase!
    self
  end
  alias downcase downcase!

  def upcase!
    self
  end
  alias upcase upcase!

  def yesno
    'No'
  end
end
