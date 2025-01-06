require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:a_business) { build(:business) }
  let(:an_employee) { build(:employee, business: a_business) }

  before do
    an_employee.save!
    a_business.save!
  end

  describe "validity" do
    it 'is valid' do
      expect(an_employee).to be_valid
    end

    context "when missing name" do
      before do
        an_employee.update_column(:name, nil) # avoids validations
      end

      it 'is not valid' do
        expect(an_employee).to_not be_valid
      end
    end

    context "when missing role" do
      before do
        an_employee.update_column(:role, nil) # avoids validations
      end

      it 'is not valid' do
        expect(an_employee).to_not be_valid
      end
    end
  end
end
