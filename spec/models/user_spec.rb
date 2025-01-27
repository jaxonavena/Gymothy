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
#  admin           :boolean          default(FALSE), not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:a_user) { build(:user) }

  before do
    a_user.save!
  end

  it 'is valid' do
    expect(a_user).to be_valid
  end

  it 'is not valid with a missing attribute' do
    a_user.update_column(:email, nil) # avoids validations
    expect(a_user).to_not be_valid
  end
end
