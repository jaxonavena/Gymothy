# frozen_string_literal: true

# == Schema Information
#
# Table name: sites
#
#  id           :integer          not null, primary key
#  latitude     :string
#  longitude    :string
#  address      :string
#  manager_name :string
#  phone        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string
#  business_id  :integer
#
FactoryBot.define do
  factory :site do
    latitude { "33.021469" }
    longitude { "-97.284103" }
    address { "2800 S Interstate 35 E, Denton, TX 76210" }
    phone { "123-123-1234" }
  end
end
