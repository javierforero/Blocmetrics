FactoryGirl.define do
  factory :registered_app do
    name Faker::Hipster.sentence(3, true, 4)
    url Faker::Internet.url
    user nil
  end
end
