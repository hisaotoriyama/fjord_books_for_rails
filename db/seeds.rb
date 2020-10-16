# frozen_string_literal: true

50.times do |n|
  Book.create!(
    title: "test book No.#{n + 1}",
    memo: "contents#{n + 1}",
    author: "test author No.#{n + 1}",
  )
end
