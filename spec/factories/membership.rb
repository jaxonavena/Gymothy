FactoryBot.define do
  factory :membership do
    member
    business
    status { :active }
    subscription { :trial }
  end
end
