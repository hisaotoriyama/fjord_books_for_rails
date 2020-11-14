# frozen_string_literal: true

users = 5.times.map do |n|
  User.create!(email: "sample-#{n}@example.com", name: Faker::Name.name, password: 123456)
end

users.each do |user|
  5.times do |n|
    user.books.create!(
      title: Faker::Book.title,
      memo: Faker::Book.genre,
      author: Faker::Book.author,
    )
  end
end
