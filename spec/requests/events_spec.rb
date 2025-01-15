require 'rails_helper'

RSpec.xdescribe "Events", type: :request do
  let(:a_business) { build(:business) }
  let(:an_event) { build(:event, business: a_business) }

  before do
    a_business.save!
    an_event.save!
  end

  describe "rendering events#index" do
    it "returns a successful response" do
      get business_events_path(a_business)
      expect(response).to have_http_status(200)
    end
  end

  describe "showing an event" do
    it "successfully renders an event" do
      get business_event_path(a_business, an_event)
      expect(response).to have_http_status(200)
      expect(response.body).to include("Factory Event")
    end
  end

  describe "creating an event" do
    it "creates a new event" do
      expect {
        post business_events_path(a_business), params: { event: { name: "Jaxon's Event" } }
      }.to change(Event, :count).by(1)
      expect(response).to redirect_to(business_event_path(a_business, Event.last))
    end
  end

  describe "editing an event" do
    it "updates an event" do
      patch business_event_path(an_event), params: { event: { name: "Updated Event" } }
      expect(response).to redirect_to(business_event_path(a_business, an_event))
      an_event.reload
      expect(an_event.name).to eq("Updated Event")
    end
  end

  describe "destroying an event" do
    it "deletes the event" do
      expect {
        delete business_event_path(a_business, an_event)
      }.to change(Event, :count).by(-1)
      expect(response).to redirect_to(business_events_path(a_business))
    end
  end
end
