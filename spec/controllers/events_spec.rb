require 'rails_helper'

RSpec.xdescribe EventsController, type: :controller do
  let(:a_business) { create(:business) }
  let(:an_event) { create(:event, business: a_business) }
  let(:a_user) { create(:user, admin: true) }

  before do
    sign_in a_user
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index, params: { business_id: a_business.id }
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "successfully renders an event" do
      get :show, params: { business_id: a_business.id, id: an_event.id }
      expect(response).to have_http_status(200)
      expect(response.body).to include("Factory Event")
    end
  end

  describe "POST #create" do
    it "creates a new event" do
      expect {
        post :create, params: { business_id: a_business.id, event: { name: "Jaxon's Event" } }
      }.to change(Event, :count).by(1)

      expect(response).to redirect_to(business_event_path(a_business, Event.last))
    end
  end

  describe "PATCH #update" do
    it "updates an event" do
      patch :update, params: { business_id: a_business.id, id: an_event.id, event: { name: "Updated Event" } }

      expect(response).to redirect_to(business_event_path(a_business, an_event))
      an_event.reload
      expect(an_event.name).to eq("Updated Event")
    end
  end

  describe "DELETE #destroy" do
    it "deletes the event" do
      an_event  # Ensure the event exists before the test
      expect {
        delete :destroy, params: { business_id: a_business.id, id: an_event.id }
      }.to change(Event, :count).by(-1)

      expect(response).to redirect_to(business_events_path(a_business))
    end
  end
end
