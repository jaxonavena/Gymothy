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
class Member < ApplicationRecord
  has_many :memberships, dependent: destroy
  has_many :businesses, through: :memberships
  # has_many :visits
  # has_many :sites, through: :visits

  validates :name, presence: true
  validates :email, presence: true, unless: -> { phone_number.present? }
  validates :phone_number, presence: true, unless: -> { email.present? }
end
