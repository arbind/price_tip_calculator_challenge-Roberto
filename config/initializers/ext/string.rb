# frozen_string_literal: true

class String
  def to_boolean
    token = squish.downcase
    token = 'false' if %w[no n 0 false].include? token
    return false if token.empty?

    ActiveModel::Type::Boolean.new.cast(token)
  end
  alias to_bool to_boolean

  def to_key
    squish.underscore.gsub('.', '_').gsub(' ', '_').gsub(/_+/, '_')
  end

  def yesno
    if [true, :yes].include? squish.downcase.to_sym
      'Yes'
    else
      'No'
    end
  end
end
