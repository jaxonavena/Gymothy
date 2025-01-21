# frozen_string_literal: true

# == Schema Information
#
# Table name: businesses
#
#  id          :integer          not null, primary key
#  name        :string
#  owner_name  :string
#  owner_phone :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Business < ApplicationRecord
  include AccessibleByUser

  has_many :sites, dependent: :destroy

  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :member

  has_many :events, dependent: :destroy

  has_many :employees

  validates :name, presence: true
  validates :owner_name, presence: true
  validates :owner_phone, presence: true

  def toggle_schedule_display
    display_schedule = !display_schedule
  end
end
