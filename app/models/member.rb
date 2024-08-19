# frozen_string_literal: true

class Member < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, unless: -> { phone_number.present? }
  validates :phone_number, presence: true, unless: -> { email.present? }
end
