# frozen_string_literal: true

require 'application_system_test_case'
require 'webdrivers'

class RelationshipTest < ApplicationSystemTestCase
  setup do
    @user_1 = users(:user_1)
    @user_2 = users(:user_2)
    @user_3 = users(:user_3)
    visit root_path
    fill_in 'メールアドレス', with: "sample-1@example.com"
    fill_in 'パスワード', with: 111111
    click_button 'ログイン'
  end

  test "follow and unfollow another user_3" do
    visit user_path(@user_3)
    assert_selector 'h1', text: '他ユーザーページ'
    assert_difference "@user_3.followers.count", 1 do
        click_link "フォローする"
    end

    visit user_path(@user_1)
    assert_selector 'h1', text: 'ログインユーザーページ'  
    assert_text @user_3.name

    visit user_path(@user_3)
    assert_selector 'h1', text: '他ユーザーページ'
    assert_difference "@user_3.followers.count", -1 do
        click_link "フォロー外す"
    end
  end

  test "all the users for follow" do
    click_link 'ユーザー一覧'
    assert_selector 'h1', text: 'ユーザー一覧'
    assert_text @user_2.name
    assert_text 'フォローする'
    assert_text @user_3.name
    assert_text 'フォローする'
  end
end
