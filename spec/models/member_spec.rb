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
require 'rails_helper'

RSpec.describe Member, type: :model do
  let(:a_member) { build(:member) }

  before do
    a_member.save!
  end

  describe "validity" do
    it 'is valid' do
      expect(a_member).to be_valid
    end

    context "when missing both email and phone number" do
      before do
        a_member.update_column(:email, nil) # avoids validations
      end

      it 'is not valid' do
        expect(a_member).to_not be_valid
      end
    end

    context "when missing email, but having phone number" do
      before do
        a_member.update_column(:email, nil) # avoids validations
        a_member.update_column(:phone_number, nil) # avoids validations
      end

      it 'is valid' do
        a_member.update_column(:email, nil)
        expect(a_member).to_not be_valid
      end
    end
  end
end
