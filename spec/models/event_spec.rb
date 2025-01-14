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
end
