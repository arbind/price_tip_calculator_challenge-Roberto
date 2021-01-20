# frozen_string_literal: true

module Mongoid
  module Document
    def as_json(options={})
      attrs = super(options)
      attrs['id'] = attrs['_id'].to_s
      attrs.delete '_id'
      attrs
    end

    def reload_if_persisted
      reload if persisted?
    end

    def save_and_skip_callbacks
      return false unless changed?

      self.class.where(id: id).update_all(__changed_attributes)
    end

    def __changed_attributes
      return {} unless changed?

      changes.map { |key, value| [key, value.last] }.to_h
    end
  end
end
