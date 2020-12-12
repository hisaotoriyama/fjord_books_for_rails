# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'followする' do
    @user1 = users(:user1)
    @user2 = users(:user2)
    @user1.follow(@user2)
    assert @user1.following?(@user2)
  end

  test 'unfollowする' do
    @user1 = users(:user1)
    @user2 = users(:user2)
    follow = @user1.active_relationships.create(follower: @user2)
    follow.save
    @user1.unfollow(@user2)
    assert_not @user1.following?(@user2)
  end

  test 'dummy-email作成' do
    dummy_user = users(:user1)
    assert_equal User.dummy_email(dummy_user), '206669143-github@example.com'
  end

  test '登録済みユーザー情報取得（githubログイン）' do
    @user1 = users(:user1)
    auth = OmniAuth::AuthHash.new({
                                    uid: '206669143',
                                    provider: 'github'
                                  })
    auth_user = User.find_for_github_oauth(auth)
    assert_equal(auth_user, @user1)
  end
end
