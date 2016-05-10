require 'rails_helper'


RSpec.describe User, type: :model do
  let(:user){ create(:user)}

  it { is_expected.to validate_presence_of(:name)}
  it { is_expected.to validate_length_of(:name).is_at_least(1) }
  it { is_expected.to validate_presence_of(:email)}
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_length_of(:password).is_at_least(8) }

  describe "user attributes matches" do

    it "should have name, email, and password as user" do
      expect(user).to have_attributes(name: user.name, email: user.email, password: user.password)
    end
  end
end
