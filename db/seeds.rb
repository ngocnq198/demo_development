User.create!(name:  "Nguyen Quang Ngoc",
  email: "ngoc@gmail.com",
  password: "123456",
  password_confirmation: "123456")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
    email: email,
    password: password,
    password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  title  = Faker::Lorem.words(2..10)
  users.each { |user| user.microposts.create!(content: content, title: title) }
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
