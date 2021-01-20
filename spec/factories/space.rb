FactoryBot.define do

  factory :space do
    type { :booth_10x10 }
    price_in_cents { rand(350000) + 10000 }
  end

end
