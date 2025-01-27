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
  let(:a_business) { build(:business) }

  before do
    a_member.save!
    a_business.save!
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

  describe "visiting sites" do
    let(:a_site) { build(:site, business: a_business) }

    it "can visit a site" do
      expect(a_site.members.include?(a_member)).to eq(false)
      a_member.visit(a_site)
      expect(a_site.members.include?(a_member)).to eq(true)
    end

    xit "tracks the number of visits made to the site" do
      a_member.visit(a_site)
      visit = Visit.find_by(member_id: a_member, site_id: a_site)
      expect(visit.count).to eq(1)
      a_member.visit(a_site)
      expect(visit.count).to eq(2)
    end
  end

  describe "memberships" do
    let(:a_membership) { build(:membership, member: a_member, business: a_business) }

    before do
      a_membership.save!
    end

    it "can have a membership at a business" do
      expect(a_membership).to be_valid
      expect(a_business.members.include?(a_member)).to eq(true)
    end
  end

  describe "events" do
    let(:an_event) { build(:event, business: a_business) }

    before do
      an_event.save!
    end

    context "interests" do
      let(:an_interest) { build(:interest, member: a_member, event: an_event) }

      before do
        an_interest.save!
      end

      it "can be interested in an event" do
        expect(an_interest).to be_valid
        expect(an_event.interested_members.include?(a_member)).to eq(true)
        expect(a_member.interested_events.include?(an_event)).to eq(true)
      end
    end
  end
end
