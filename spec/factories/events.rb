FactoryGirl.define do
  factory :event do
    registered_app nil
    name Faker::Hacker.verb
  end
end
