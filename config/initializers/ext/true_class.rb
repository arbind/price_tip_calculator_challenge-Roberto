class TrueClass
  def to_boolean
    self
  end
  alias_method :to_bool, :to_boolean

  def yesno
    "Yes"
  end

  def to_sym() :true end
end
