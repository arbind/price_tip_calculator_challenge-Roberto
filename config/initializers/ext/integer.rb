# frozen_string_literal: true

class Integer
  def to_boolean
    !zero?
  end
  alias to_bool to_boolean

  def to_key
    self
  end

  def yesno
    if to_boolean
      'Yes'
    else
      'No'
    end
  end
end
