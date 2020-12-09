# frozen_string_literal: true

require 'application_system_test_case'
# require 'webdrivers'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:book1)
    @user = users(:user1)
    visit root_path
    fill_in 'メールアドレス', with: 'sample-1@example.com'
    fill_in 'パスワード', with: 111_111
    click_button 'ログイン'
  end

  test 'visiting the Book/index' do
    visit books_path
    assert_selector 'h1', text: '書籍一覧'
    assert_text '書籍名'
    assert_text '補足'
    assert_text '著者'
    assert_text '表紙イメージ'
    assert_text 'ユーザーID'
    assert_text 'ログインユーザー'
    assert_text 'ログインユーザーID'
  end

  test 'creating a Book' do
    visit books_path
    click_on '新規書籍追加'
    fill_in '書籍名', with: @book.title
    fill_in '補足', with: @book.memo
    fill_in '著者', with: @book.author
    click_button 'Create 本'
    assert_text '書籍新規登録できました。'
  end

  test 'updating a Book' do
    visit user_path(@user)
    click_on '本編集'
    fill_in '書籍名', with: 'The Good Earth'
    fill_in '補足', with: '大地'
    fill_in '著者', with: 'Pearl Sydenstricker Buck'
    click_on 'Update 本'
    assert_text '書籍更新登録できました。'
  end

  test 'showing a Book' do
    visit user_path(@user)
    click_on '本表示'
    assert_text '書籍名'
    assert_text @book.title
    assert_text '補足'
    assert_text @book.memo
    assert_text '著者'
    assert_text @book.author
    assert_text '表紙イメージ'
    assert_text @book.picture
  end

  test 'destroying a Book' do
    visit user_path(@user)
    page.accept_confirm do
      click_on '本削除'
    end
    assert_text '削除できました。'
  end
end
