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
require 'rails_helper'

RSpec.describe Site, type: :model do
  let(:a_site) { build(:site) }

  before do
    a_site.save!
  end

  it 'is valid' do
    expect(a_site).to be_valid
  end

  it 'is not valid with a missing attribute' do
    a_site.update_column(:latitude, nil) # avoids validations
    expect(a_site).to_not be_valid
  end
end
