# frozen_string_literal: true

class TrueClass
  def to_boolean
    self
  end
  alias to_bool to_boolean

  def yesno
    'Yes'
  end

  def to_sym
    true
  end
end
