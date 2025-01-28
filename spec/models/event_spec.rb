require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:a_business) { build(:business) }
  let(:an_event) { build(:event, business: a_business) }

  before do
    a_business.save!
    an_event.save!
  end

  describe "validity" do
    it 'is valid' do
      expect(an_event).to be_valid
    end

    context "when missing name" do
      before do
        an_event.update_column(:name, nil) # avoids validations
      end

      it 'is not valid' do
        expect(an_event).to_not be_valid
      end
    end

    context "when missing start_time" do
      before do
        an_event.update_column(:start_time, nil) # avoids validations
      end

      it 'is not valid' do
        expect(an_event).to_not be_valid
      end
    end

    context "when missing end_time" do
      before do
        an_event.update_column(:end_time, nil) # avoids validations
      end

      it 'is not valid' do
        expect(an_event).to_not be_valid
      end
    end
  end

  describe "member interest" do
    let(:a_member) { build(:member) }
    let(:a_membership) { build(:membership, member: a_member, business: a_business) }

    before do
      a_member.set_interest_in_event(an_event)
      a_member.save!
      a_business.save!
    end

    it "can have an interested member" do
      expect(an_event.interested_members.include?(a_member)).to eq(true)
      expect(a_member.interested_events.include?(an_event)).to eq(true)
    end

    describe "status" do
      it "defaults to 'Interested' " do
        expect(an_event.interests.last.status).to eq("Interested")
      end

      it "can update the interest status" do
        a_member.update_interest_in_event(an_event, "Going")
        expect(an_event.interests.last.status).to eq("Going")
      end

      it "can reset the interest status" do
        a_member.update_interest_in_event(an_event, "Going")
        a_member.reset_interest_in_event(an_event)
        expect(an_event.interests.last.status).to_not eq("Going")
        expect(an_event.interests.last.status).to eq("Interested")
      end
    end

    it "can destroy the interest" do
      expect(an_event.interests.last).to eq(a_member.interests.last)

      expect(an_event.interests.count).to eq(1)
      a_member.destroy_interest_in_event(an_event)
      expect(an_event.interests.count).to eq(0)

      an_event.reload
      a_member.reload

      expect(an_event.interests).to be_empty
      expect(a_member.interests).to be_empty
    end
  end
end
