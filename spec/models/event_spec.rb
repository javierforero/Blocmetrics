require 'rails_helper'

RSpec.describe Event, type: :model do
   let(:my_user){create(:user)}
   let(:my_app){create(:registered_app, user: my_user)}
   let!(:my_event){create(:event, registered_app: my_app)}

   describe "tests for attributes" do

     it "has correct a values" do
       expect(my_event).to have_attributes(registered_app_id: my_event.registered_app_id, name: my_event.name)
     end
   end
end
