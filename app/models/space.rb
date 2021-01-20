# frozen_string_literal: true

class Space
  include Mongoid::Document
  include Mongoid::Timestamps

  field :type, type: :symbol
  field :price_in_cents, type: :integer, default: 0

  embedded_in :event_listing
end
