# frozen_string_literal: true

require 'application_system_test_case'
require 'webdrivers'

class BookCommentsTest < ApplicationSystemTestCase
  setup do
    @book = books(:book1)
    @user = users(:user1)
    visit root_path
    fill_in 'メールアドレス', with: 'sample-1@example.com'
    fill_in 'パスワード', with: 111_111
    click_button 'ログイン'

    visit book_path(@book)
    fill_in 'コメント本文', with: '普通の本'
    click_button 'Create コメント'
  end

  test 'creating a Book Comment' do
    visit book_path(@book)
    fill_in 'コメント本文', with: '素晴らしい本'
    click_button 'Create コメント'
    assert_text '素晴らしい本'
  end

  test 'updating a Book Comment' do
    assert_text '普通の本'
    click_link 'コメント編集', match: :first
    fill_in 'コメント本文', with: '本のコメント、書き直し'
    click_button 'Update コメント'
    assert_text '本のコメント、書き直し'
    assert_text 'コメント更新登録できました。'
  end

  test 'destroying a Book Comment' do
    assert_text '普通の本'
    page.accept_confirm do
      click_link 'コメント削除', match: :first
    end
    assert_text 'コメント削除できました。'
  end
end
