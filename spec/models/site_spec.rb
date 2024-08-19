# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Site, type: :model do
  it 'is valid with valid attributes' do
    site = Site.new(latitude: lat, longitude: long, address: "2800 S Interstate 35 E, Denton, TX 76210", phone: "913-000-9191")
    expect(site).to be_valid
  end

  it 'is not valid without an email' do
    site = Site.new(password: 'password')
    expect(site).to_not be_valid
  end
end