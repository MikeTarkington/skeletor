require 'faker'

max_users = 15
users_needed = max_users - User.count

users_needed.times do
  person = {}
  person[:username] = Faker::Internet.user_name(5..8)
  person[:email] = Faker::Internet.safe_email
  person[:password] = Faker::Internet.password(5, 10)

  user = User.create(person)

end
