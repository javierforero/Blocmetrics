require 'faker'

25.times do
  pw = Faker::Internet.password(8)
  User.create!(

  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: pw,
  password_confirmation: pw,
  confirmed_at: Faker::Date.backward(16)
  )
end

users = User.all


100.times do
  RegisteredApp.create!(

    name: Faker::Hipster.sentence(3, true, 4),
    url: Faker::Internet.url,
    user: users.sample
  )
end

 apps = RegisteredApp.all

 600.times do
   Event.create!(
     name: Faker::Hacker.verb,
     registered_app: apps.sample
   )
 end

 puts "seeds finished!"
 puts "#{User.count} users created"
 puts "#{RegisteredApp.count} registered apps created"
 puts "#{Event.count} events created"
