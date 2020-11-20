# frozen_string_literal: true

5.times do |n|
  user = User.create!(email: "sample-#{n}@example.com", name: Faker::Name.name, password: 123_456)
  5.times do
    user.books.create!(
      title: Faker::Book.title,
      memo: Faker::Book.genre,
      author: Faker::Book.author
    )
  end
end

users.each do |user|
  5.times do |_n|
    Report.create!(
      title: Faker::Name.first_name,
      body: Faker::Quote.famous_last_words,
      user_id: user.id
    )
  end
end
