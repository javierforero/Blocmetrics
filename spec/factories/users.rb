FactoryGirl.define do
  pw = Faker::Internet.password(8)
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    password pw
    password_confirmation pw
    confirmed_at Faker::Date.between(1.year.ago, Date.today)
  end
end
