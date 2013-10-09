require 'faker'

5.times do
  User.create(user_name: Faker::Name.first_name,
              password: Faker::Lorem.word, 
              real_name: Faker::Name.name)
end
