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
class Site < ApplicationRecord
  include AccessibleByUser

  belongs_to :business

  has_many :visits
  has_many :members, through: :visits

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :address, presence: true
  validates :phone, presence: true
end
