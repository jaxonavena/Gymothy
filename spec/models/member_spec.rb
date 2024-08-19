# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Member, type: :model do
  let(:a_member) { build(:member) }
  it 'is valid with valid attributes' do
    user = User.new(email: 'test@example.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user = User.new(password: 'password')
    expect(user).to_not be_valid
  end
end
