User.create! name: "admin", email: "admin@gmail.com",
  password: "123123", password_confirmation: "123123", role: 1

10.times do |n|
  name: Faker::FunnyName.name
  password: "password"
  password_confirmation: "password"
  role: 0
end
category_ids = (1..6).to_a.map do |n|
  Category.create!(
    name: Faker::Coffee.blend_name
  )
end
name = ["Sport","Blockchain", "Programming", "Pets", "Technology", "IOS Dev", "Android Dev"]
7.times do |n|
  Category.create!(
    name: name[n]
  )
end
10.times do |n|
  Post.create!(
  title: Faker::Device.manufacturer,
  content: Faker::Lorem.paragraph,
  categories: category_ids,
  user_id: rand(9..10)
  )
end
10.times do |n|
  Rate.create(
    content: Faker::Coffee.variety
    star: rand(2..5)
    user_id: rand(9..10)
  )
end
