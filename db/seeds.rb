# frozen_string_literal: true

USER_ID_RANGE = (18..25)
USER_ID_RANGE.each do |num|
  5.times do |n|
    Book.create!(
      title: Faker::Book.title,
      memo: Faker::Book.genre,
      author: Faker::Book.author,
      user_id: num
    )
  end
end
