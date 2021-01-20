class Array
  def sum
    inject(0.0) { |result, el| result + el }
  end

  def mean 
    sum / size
  end
  alias_method :avg, :mean
  alias_method :average, :mean

end