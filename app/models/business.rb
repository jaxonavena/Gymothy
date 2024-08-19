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

  has_many :sites
  has_many :members
end
