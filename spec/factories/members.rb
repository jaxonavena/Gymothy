# frozen_string_literal: true

# == Schema Information
#
# Table name: members
#
#  id           :integer          not null, primary key
#  name         :string
#  phone_number :string
#  email        :string
#  birthday     :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :member do
    name { "Joe Shmoe" }
    email { "joeshmoe@gmail.com" }
  end
end
