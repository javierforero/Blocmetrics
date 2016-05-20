require 'rails_helper'

RSpec.describe API::EventsController, type: :controller do
  let(:my_user){ create(:user) }
  let(:my_app){ create(:registered_app, url: "hi.com", user: my_user)}
  let!(:event){ my_app.events.create(name: "test my api")}

  context "URL corresponds to a registered app" do
    before do
      @request.env['HTTP_ORIGIN'] = "hi.com"
      post :create, event: {name: "testing rspec"}
    end
    describe "create an event" do
      it "POST create successfully creates a new event" do
        expect(response).to have_http_status(:success)
      end

      it "Assures event name is set correctly" do
        expect(my_app.events.find_by(name:"testing rspec")).not_to be_nil
      end
    end
  end

  context "unregistered app fails" do
    before do
      @request.env['HTTP_ORIGIN'] = "blah.com"
      post :create, event: {name: "testing rspec"}
    end

    it "fails" do
      expect(response).to have_http_status(400)
    end

  end
end
