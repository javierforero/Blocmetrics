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

  describe "creates a registered_app" do
    it "increases registered_app record count by 1" do
      expect{post :create, user_id: my_user.id, registered_app: {name: "app", url: "we.com", user_id: my_user.id }}.to change(RegisteredApp, :count).by(1)
    end
  end

  describe '#update' do
    context 'disabling with AJAX' do

      before { post :update, id: my_app.id, user_id: my_user.id, registered_app: { enable: false }, format: :js }

      it 'disables the registered applicaiton' do
        expect(my_app.reload.enable).to eq(false)
      end

      it 'respond with something interesting' do
        expect(response).to have_http_status(:ok)
      end
    end

  end

end
