# frozen_string_literal: true

FactoryBot.define do
  factory :event_listing do
    reach { rand(300..3799) }
  end
end
