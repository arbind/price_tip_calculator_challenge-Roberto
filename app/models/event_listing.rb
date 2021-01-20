# frozen_string_literal: true

class EventListing
  include Mongoid::Document
  include Mongoid::Timestamps

  field :reach, type: :integer, default: 0
  field :starts_at, type: :date_time, default: nil
  field :ends_at, type: :date_time, default: nil

  embeds_many :spaces

  def add_space space_type, price_in_cents
    type = type_for(space_type)
    space = space_for type
    space ||= spaces.build type: type
    space.update price_in_cents: price_in_cents.to_i
    space
  end

  def add_space! space_type, price_in_cents
    space = add_space space_type, price_in_cents
    save
    space
  end

  def space_for space_type
    spaces.where(type: type_for(space_type)).first
  end

  private

  def type_for space_type
    space_type.to_s.to_sym
  end
end
