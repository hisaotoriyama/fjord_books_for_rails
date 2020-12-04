# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:book_1)
    @user = users(:user_1)
    # login_as(@user)
    # visit root_url
    # login_as @user
    # fill_in 'メールアドレス', with: 'sample-1@example.com'
  #   fill_in 'パスワード', with: 'password'
  #   click_button 'ログイン'
  end

   test "the truth1" do
    p @book
    p @user
    assert true
  end

  # test 'visiting the index' do
  #   visit books_url
  #   assert_selector 'h1', text: 'Books'
  # end

  # test 'creating a Book' do
  #   visit books_url
  #   click_on 'New Book'

  #   fill_in 'Author', with: @book.author
  #   fill_in 'Memo', with: @book.memo
  #   fill_in 'Picture', with: @book.picture
  #   fill_in 'Title', with: @book.title
  #   click_on 'Create Book'

  #   assert_text 'Book was successfully created'
  #   click_on 'Back'
  # end

  # test 'updating a Book' do
  #   visit books_url
  #   click_on 'Edit', match: :first

  #   fill_in 'Author', with: @book.author
  #   fill_in 'Memo', with: @book.memo
  #   fill_in 'Picture', with: @book.picture
  #   fill_in 'Title', with: @book.title
  #   click_on 'Update Book'

  #   assert_text 'Book was successfully updated'
  #   click_on 'Back'
  # end

  # test 'destroying a Book' do
  #   visit books_url
  #   page.accept_confirm do
  #     click_on 'Destroy', match: :first
  #   end

  #   assert_text 'Book was successfully destroyed'
  # end
end
