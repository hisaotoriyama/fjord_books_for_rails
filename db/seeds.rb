# frozen_string_literal: true

users = 5.times.map do |n|
  User.create!(email: "sample-#{n}@example.com", name: Faker::Name.name, password: 123456)
end

users.each do |user|
  5.times do |n|
    Book.create!(
      title: Faker::Book.title,
      memo: Faker::Book.genre,
      author: Faker::Book.author,
      user_id: user.id
    )
  end
end

users.each do |user|
  5.times do |n|
    Report.create!(
      title: Faker::Name.first_name,
      body: Faker::Quote.famous_last_words,
      user_id: user.id
    )
  end
end

