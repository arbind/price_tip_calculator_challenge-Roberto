# frozen_string_literal: true

class FalseClass
  def to_boolean
    self
  end
  alias to_bool to_boolean

  def yesno
    'No'
  end

  def to_sym
    false
  end
end
