class Event < ApplicationRecord
  belongs_to :business

  has_many :interests
  has_many :interested_members, through: :interests, source: :member

  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
