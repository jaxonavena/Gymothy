require 'rails_helper'

RSpec.describe Membership, type: :model do
  let(:a_business) { build(:business) }
  let(:a_member) { build(:member) }
  let(:a_membership) { build(:membership, member: a_member, business: a_business) }

  before do
    a_business.save!
    a_member.save!
    a_membership.save!
  end

  describe "validity" do
    it 'is valid' do
      expect(a_membership).to be_valid
    end
  end

  describe "status" do
    it "defaults to active" do
      expect(a_membership.status).to eq("active")
      expect(a_membership.active?).to eq(true)
    end
  end

  describe "subscription" do
    it "defaults to trial" do
      expect(a_membership.subscription).to eq("trial")
    end
  end
end
