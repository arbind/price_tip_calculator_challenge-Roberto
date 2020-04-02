class FalseClass
  def to_boolean
    self
  end
  alias_method :to_bool, :to_boolean

  def yesno
    "No"
  end

  def to_sym() :false end
end
