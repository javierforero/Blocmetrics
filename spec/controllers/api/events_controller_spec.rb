require 'rails_helper'

RSpec.describe API::EventsController, type: :controller do
  let(:my_user){ create(:user) }
  let(:my_app){ create(:registered_app, url: "hi.com", user: my_user)}
  let!(:event){ my_app.events.create(name: "test my api")}

  context "URL corresponds to a registered app" do
    before do
      post :create, event: {name: "testing rspec"}
    end
    describe "create an event" do
      it "POST create successfully creates a new event" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
