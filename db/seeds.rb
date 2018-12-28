User.create! name: "admin", email: "admin@gmail.com",
  password: "123456", password_confirmation: "123456", role: 1

User.create! name: "nhc", email: "huuco2401@gmail.com",
  password: "123123", password_confirmation: "123123"
Rate.create! user_id: 2, post_id: 1, point: 4
Post.create! title: "Title", content: "content", user_id: 2
49.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create! name: name, email: email,
    password: password, password_confirmation: password
end
