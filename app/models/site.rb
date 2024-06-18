class Site < ApplicationRecord
  # belongs_to :business
  # has_many :employees

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :address, presence: true
  validates :phone, presence: true
end
