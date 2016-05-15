require 'rails_helper'

RSpec.describe RegisteredAppsController, type: :controller do
  let(:my_user){ create(:user)}
  let!(:my_app){ create(:registered_app, user: my_user)}

  describe "GET #new" do
    it "returns http success" do
      get :new, user_id: my_user.id
      expect(response).to have_http_status(:success)
    end
  end

end
