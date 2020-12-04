require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#follow" do
    me = User.create!(email:"me@example.com", name:"me",  password: "password")
    she = User.create!(email:"she@example.com", name:"she",  password: "password")
    me.follow(she) 
    assert me.following?(she)
    me.unfollow(she) 
    assert_not me.following?(she)
  end

  test "#dummy_email_creation" do
    dummy_user =  User.create!(email: "dummy_user@example.com", name: "dummy_user",  password: "password", uid: 1, provider: "github")
    assert_equal User.dummy_email(dummy_user), "1-github@example.com"
  end
end
