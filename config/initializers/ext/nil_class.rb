class NilClass

  def empty?() true end

  def to_boolean() false end
  alias_method :to_bool, :to_boolean

  def to_sym() self end

  def compact() self end

  def to_key() self end

  def strip!() self end
  alias_method :strip, :strip!

  def squish!() self end
  alias_method :squish, :squish!

  def downcase!() self end
  alias_method :downcase, :downcase!

  def upcase!() self end
  alias_method :upcase, :upcase!

  def yesno
    "No"
  end

end
