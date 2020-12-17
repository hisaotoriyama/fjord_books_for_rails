# frozen_string_literal: true

require 'application_system_test_case'
# require 'webdrivers'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:book1)
    @user = users(:user1)
    visit root_path
    fill_in 'メールアドレス', with: 'sample-1@example.com'
    fill_in 'パスワード', with: '111111'
    click_button 'ログイン'
  end

  test '書籍一覧画面展開' do
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

  test '新規書籍追加' do
    visit books_path
    click_on '新規書籍追加'
    fill_in '書籍名', with: 'Gone with the wind'
    fill_in '補足', with: 'Histric Great Movie'
    fill_in '著者', with: 'Margaret Munnerlyn Mitchell'
    click_button '登録する'
    assert_text '書籍新規登録できました。'
    assert_text '書籍名'
    assert_text 'Gone with the wind'
    assert_text '補足'
    assert_text 'Histric Great Movie'
    assert_text '著者'
    assert_text 'Margaret Munnerlyn Mitchell'
    assert_text '表紙イメージ'
    assert_text 'Margaret Munnerlyn Mitchell'
    assert_text '編集'
    assert_text '戻る'
    assert_selector 'h2', text: 'コメント一覧'
    assert_text 'コメント者'
    assert_text 'コメント本文'
    assert_text 'コメント作成日時'
    assert_text 'コメント本文'
  end

  test '書籍更新登録' do
    visit user_path(@user)
    within '[data-test=user-book-edit-206669143]' do
      click_on '編集'
    end
    fill_in '書籍名', with: 'The Good Earth'
    fill_in '補足', with: '大地'
    fill_in '著者', with: 'Pearl Sydenstricker Buck'
    click_on '更新する'
    assert_text '書籍更新登録できました。'
    assert_text '書籍名'
    assert_text 'The Good Earth'
    assert_text '補足'
    assert_text '大地'
    assert_text '著者'
    assert_text 'Pearl Sydenstricker Buck'
    assert_text '編集'
    assert_text '戻る'
    assert_selector 'h2', text: 'コメント一覧'
    assert_text 'コメント者'
    assert_text 'コメント本文'
    assert_text 'コメント作成日時'
    assert_text 'コメント本文'
  end

  test '個別書籍表示' do
    visit user_path(@user)
    within '[data-test=user-book-show-206669143]' do
      click_on '表示'
    end
    assert_text '書籍名'
    assert_text 'Gone with the wind'
    assert_text '補足'
    assert_text 'Histric Great Movie'
    assert_text '著者'
    assert_text 'Margaret Munnerlyn Mitchell'
    assert_text '表紙イメージ'
    assert_text 'Margaret Munnerlyn Mitchell'
  end

  test '書籍登録削除' do
    visit user_path(@user)
    page.accept_confirm do
      within '[data-test=user-book-destroy-206669143]' do
        click_on '削除'
      end
    end
    assert_text '削除できました。'
    assert_selector 'h1', text: '書籍一覧'
    assert_text '書籍名'
    assert_text '補足'
    assert_text '著者'
    assert_text '表紙イメージ'
    assert_text 'ユーザーID'
  end
end
