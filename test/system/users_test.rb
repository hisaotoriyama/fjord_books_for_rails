# frozen_string_literal: true

require 'application_system_test_case'
# require 'webdrivers'

class UserTest < ApplicationSystemTestCase
  setup do
    @user = users(:user1)
    visit root_path
    fill_in 'メールアドレス', with: 'sample-1@example.com'
    fill_in 'パスワード', with: '111111'
    click_button 'ログイン'
  end

  test 'ユーザー一覧画面展開' do
    visit users_path
    assert_selector 'h1', text: 'ユーザー一覧'
    assert_text 'ID'
    assert_text '名前'
    assert_text 'メールアドレス'
    assert_text 'フォロー'
    assert_text 'フォロー先'
    assert_text 'フォロワー先'
  end

  test '新規ユーザー追加' do # rubocop:disable Metrics/BlockLength
    click_link 'ログアウト'
    visit new_user_registration_path
    fill_in '名前', with: 'Hanako Sato'
    fill_in '郵便番号', with: '555_5555'
    fill_in '住所', with: 'Saitama'
    fill_in 'プロフィール', with: 'HS profile'
    fill_in 'メールアドレス', with: 'sample-5@example.com'
    fill_in 'パスワード', with: '555555'
    fill_in 'パスワード再入力', with: '555555'
    click_button 'サインアップ'
    assert_text 'アカウント登録が完了しました。'
    click_link 'ユーザー詳細'
    assert_selector 'h1', text: 'ログインユーザーページ'
    assert_text '名前'
    assert_text 'Hanako Sato'
    assert_text 'メールアドレス'
    assert_text 'sample-5@example.com'
    assert_text '郵便番号'
    assert_text '5555555'
    assert_text '住所'
    assert_text 'Saitama'
    assert_text 'プロフィール'
    assert_text 'HS profile'
    assert_selector 'h2', text: 'フォロー'
    assert_selector 'h2', text: 'フォロワー'
    assert_selector 'h2', text: 'ユーザ選択書籍'
    assert_selector 'h2', text: 'ユーザ自身のレポート'
  end

  test 'ユーザー更新登録' do # rubocop:disable Metrics/BlockLength
    click_link 'ユーザー詳細'
    within '[data-test=user-206669143]' do
      click_link '編集'
    end
    fill_in '名前', with: 'Rev Hanako Sato'
    fill_in '郵便番号', with: '555_5555'
    fill_in '住所', with: 'Rev Saitama'
    fill_in 'プロフィール', with: 'Rev HS profile'
    fill_in 'メールアドレス', with: 'rev_sample-5@example.com'
    fill_in 'パスワード', with: 'rev555555'
    fill_in 'パスワード再入力', with: 'rev555555'
    fill_in '現在のパスワード', with: '555555'
    click_button 'アップデート'
    assert_text 'アカウント情報を変更しました。'
    assert_selector 'h1', text: 'ログインユーザーページ'
    assert_text '名前'
    assert_text 'Rev Hanako Sato'
    assert_text 'メールアドレス'
    assert_text 'rev_sample-5@example.com'
    assert_text '郵便番号'
    assert_text '5555555'
    assert_text '住所'
    assert_text 'Rev Saitama'
    assert_text 'プロフィール'
    assert_text 'Rev HS profile'
    assert_selector 'h2', text: 'フォロー'
    assert_selector 'h2', text: 'フォロワー'
    assert_selector 'h2', text: 'ユーザ選択書籍'
    assert_selector 'h2', text: 'ユーザ自身のレポート'
  end

  test 'ユーザー登録削除' do
    visit edit_user_registration_path(@user)
    page.accept_confirm do
      click_button 'アカウントをキャンセル'
    end
    assert_text 'アカウント登録もしくはログインしてください。'
    assert_selector 'h2', text: 'ログイン'
    assert_text 'メールアドレス'
    assert_text 'パスワード'
  end
end
