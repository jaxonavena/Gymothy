FactoryBot.define do
  factory :event do
    name { "Factory Event" }
    start_time { Time.now }
    end_time { Time.now + 1.hour }
  end
end