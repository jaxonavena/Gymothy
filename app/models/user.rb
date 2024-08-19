# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

  def welcome
    "Hello, #{self.email}!"
  end

  validates :email, presence: true
  validates :password_digest, presence: true
end
