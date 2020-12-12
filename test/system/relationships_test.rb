# frozen_string_literal: true

require 'application_system_test_case'
require 'webdrivers'

class RelationshipTest < ApplicationSystemTestCase
  setup do
    @user1 = users(:user1)
    @user2 = users(:user2)
    @user3 = users(:user3)
    visit root_path
    fill_in 'メールアドレス', with: 'sample-1@example.com'
    fill_in 'パスワード', with: 111111 # rubocop:disable Style/NumericLiterals
    click_button 'ログイン'
  end

  test '自分以外をfollowとunfollowする' do
    visit user_path(@user3)
    assert_selector 'h1', text: '他ユーザーページ'
    assert_difference '@user3.followers.count', 1 do
      click_link 'フォローする'
    end

    visit user_path(@user1)
    assert_selector 'h1', text: 'ログインユーザーページ'
    assert_text 'Saburo Taniguchi'
    visit user_path(@user3)
    assert_selector 'h1', text: '他ユーザーページ'
    assert_difference '@user3.followers.count', -1 do
      click_link 'フォロー外す'
    end
  end

  test 'ユーザー一覧の画面からfollowする' do
    click_link 'ユーザー一覧'
    assert_selector 'h1', text: 'ユーザー一覧'
    assert_text 'Jiro Kawakami'
    within 'div[data-testid=@user2.id]' do
      assert_text 'フォローする'
    end
    assert_text 'フォローする'
    assert_text 'Saburo Taniguchi'
    within 'div[data-testid=@user3.id]' do
      assert_text 'フォローする'
    end
  end
end
