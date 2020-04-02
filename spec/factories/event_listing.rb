FactoryBot.define do

  factory :event_listing do
    reach { 300 + rand(3500) }
  end

end
