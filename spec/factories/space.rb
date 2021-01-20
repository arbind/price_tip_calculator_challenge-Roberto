# frozen_string_literal: true

FactoryBot.define do
  factory :space do
    type { :booth_10x10 }
    price_in_cents { rand(10_000..359_999) }
  end
end
