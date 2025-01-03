# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :business
  # belongs_to :site, through: :business

  validates :name, presence: true
  validates :role, presence: true
end
