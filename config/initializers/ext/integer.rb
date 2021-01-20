class Integer
  def to_boolean
    not self.zero?
  end
  alias_method :to_bool, :to_boolean

  def to_key
    self
  end

  def yesno
    if to_boolean
      "Yes"
    else
      "No"
    end
  end
end
