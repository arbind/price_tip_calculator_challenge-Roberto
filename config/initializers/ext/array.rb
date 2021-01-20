# frozen_string_literal: true

class Array
  def sum
    inject(0.0) { |result, el| result + el }
  end

  def mean
    sum / size
  end
  alias avg mean
  alias average mean
end
