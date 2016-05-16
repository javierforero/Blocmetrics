require 'rails_helper'

RSpec.describe RegisteredApp, type: :model do
    let(:my_user){ create(:user)}
    let!(:my_app){ my_user.registered_apps.create!(name: "Big star", url: "www.imcool.com")}

    describe "it has correct attributes" do
      it "has a name, url, and user" do
        expect(my_app).to have_attributes(name: "Big star", url:"www.imcool.com", user_id: my_user.id)
      end
    end
end
