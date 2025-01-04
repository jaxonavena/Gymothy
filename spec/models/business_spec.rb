require 'rails_helper'

RSpec.describe Business, type: :model do
  let(:a_business) { create(:business) }

  before do
    a_business.save!
  end

  describe "validity" do
    it 'is valid' do
      expect(a_business).to be_valid
    end

    context "when missing name" do
      before do
        a_business.update_column(:name, nil) # avoids validations
      end

      it 'is not valid' do
        expect(a_business).to_not be_valid
      end
    end

    context "when missing owner_name" do
      before do
        a_business.update_column(:owner_name, nil) # avoids validations
      end

      it 'is not valid' do
        expect(a_business).to_not be_valid
      end
    end
  end

  describe "sites" do
    let(:a_site) { build(:site) }
    let(:another_site) { build(:site) }

    it "can have no sites" do
      expect(a_business.sites.size).to eq(0)
      expect(a_business).to be_valid
    end

    it "can have 1 site" do
      a_business.sites << a_site
      expect(a_business.sites.size).to eq(1)
      expect(a_business).to be_valid
    end

    it "can have many sites" do
      a_business.sites << a_site
      a_business.sites << another_site
      expect(a_business.sites.size).to eq(2)
      expect(a_business).to be_valid
    end
  end

  xdescribe "members" do
    let(:a_member) { create(:member) }
    let(:a_membership) { create(:membership, member: a_member, business: a_business) }

    let(:another_member) { create(:member) }
    let(:another_membership) { create(:membership, member: another_member, business: a_business) }

    before do
      a_member.save!
      a_membership.save!
      another_member.save!
      another_membership.save!
    end

    it "can have no members" do
      a_business.members.destroy_all
      expect(a_business.members.size).to eq(0)
      expect(a_business).to be_valid
    end

    it "can have 1 member" do
      expect(a_business.members.size).to eq(1)
      expect(a_business).to be_valid
    end

    it "can have many members" do
      expect(a_business.members.size).to eq(2)
      expect(a_business).to be_valid
    end
  end

  describe "employees" do
    let(:an_employee) { build(:employee) }
    let(:another_employee) { build(:employee) }

    it "can have no sites" do
      expect(a_business.employees.size).to eq(0)
      expect(a_business).to be_valid
    end

    it "can have 1 site" do
      a_business.employees << an_employee
      expect(a_business.employees.size).to eq(1)
      expect(a_business).to be_valid
    end

    it "can have many employees" do
      a_business.employees << an_employee
      a_business.employees << another_employee
      expect(a_business.employees.size).to eq(2)
      expect(a_business).to be_valid
    end
  end
end
