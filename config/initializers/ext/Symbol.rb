class Symbol

  def to_key
    to_s.squish.underscore.gsub(".","_").gsub(" ","_").gsub(/_+/, "_")
  end

  def squish() self.to_s.squish end
  def squish!() self end
  alias_method :squish, :squish!

  def split(token) self.to_s.split(token) end
end