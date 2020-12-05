# frozen_string_literal: true

require 'application_system_test_case'
require 'webdrivers'

class UserTest < ApplicationSystemTestCase
  setup do
    @user = users(:user_1)
    visit root_path
    fill_in 'メールアドレス', with: "sample-1@example.com"
    fill_in 'パスワード', with: 111111
    click_button 'ログイン'
  end

  test 'creating a User' do
    click_link 'ログアウト'
    visit new_user_registration_path
    fill_in '名前', with: "Hanako Sato"
    fill_in '郵便番号', with: 2222222
    fill_in '住所', with: "Saitama"
    fill_in 'プロフィール', with: "HS profile"
    fill_in 'メールアドレス', with: "sample-2@example.com"
    fill_in 'パスワード', with: "222222"
    fill_in 'パスワード再入力', with: "222222"
    click_button 'サインアップ'

    click_link 'ユーザー詳細'
    assert_selector 'h1', text: 'ログインユーザーページ'
    assert_text '名前'
    assert_text "Hanako Sato"

    assert_text 'メールアドレス'
    assert_text 'sample-2@example.com'  
    assert_text '郵便番号'
    assert_text 2222222
    assert_text '住所'
    assert_text "Saitama"
    assert_text 'プロフィール'
    assert_text "HS profile"
    assert_selector 'h2', text: 'フォロー'
    assert_selector 'h2', text: 'フォロワー'
    assert_selector 'h2', text: 'ユーザ選択書籍'
    assert_selector 'h2', text: 'ユーザ自身のレポート'
  end

  test 'editing a User' do
    click_link 'ユーザー詳細'
    click_link '編集'
    fill_in '名前', with: "Rev Hanako Sato"
    fill_in '郵便番号', with: 2222222
    fill_in '住所', with: "Rev Saitama"
    fill_in 'プロフィール', with: "Rev HS profile"
    fill_in 'メールアドレス', with: "rev_sample-2@example.com"
    fill_in 'パスワード', with: "rev222222"
    fill_in 'パスワード再入力', with: "rev222222"
    fill_in '現在のパスワード', with: "222222"
    click_button 'アップデート'
    assert_selector 'h1', text: 'ログインユーザーページ'
    assert_text '名前'
    assert_text "Rev Hanako Sato"
    assert_text 'メールアドレス'
    assert_text 'rev_sample-2@example.com'  
    assert_text '郵便番号'
    assert_text 2222222
    assert_text '住所'
    assert_text "Rev Saitama"
    assert_text 'プロフィール'
    assert_text "Rev HS profile"
    assert_selector 'h2', text: 'フォロー'
    assert_selector 'h2', text: 'フォロワー'
    assert_selector 'h2', text: 'ユーザ選択書籍'
    assert_selector 'h2', text: 'ユーザ自身のレポート'
  end

  test 'destroying a User' do
    visit edit_user_registration_path(@user)
    page.accept_confirm do
      click_button 'アカウントをキャンセル'
    end
  end
end
