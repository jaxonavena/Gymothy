# frozen_string_literal: true

FactoryBot.define do
  factory :site do
    latitude { "33.021469" }
    longitude { "-97.284103" }
    address { "2800 S Interstate 35 E, Denton, TX 76210" }
    phone { "123-123-1234" }
  end
end
