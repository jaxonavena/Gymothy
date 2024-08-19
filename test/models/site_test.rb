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
require "test_helper"

class SiteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
