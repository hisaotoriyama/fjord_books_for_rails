# frozen_string_literal: true

5.times do |n|
  user = User.create!(email: "sample-#{n}@example.com", name: Faker::Name.name, password: 123456)
  5.times do
    user.books.create!(
      title: Faker::Book.title,
      memo: Faker::Book.genre,
      author: Faker::Book.author,
    )
  end
end
