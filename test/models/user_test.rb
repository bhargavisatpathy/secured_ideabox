require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def valid_attributes
    {
      username: "example",
      password: "password"
    }
  end

  test "it creates a user" do
    #user = User.create(username: "example", password: "password", password_confirmation: "password")
    user = User.new(valid_attributes)
    assert user.valid?
    assert_equal "example", user.username
    assert_equal "password", user.password
  end

  test "it cannot create a user without a name" do
    user = User.new(password: "password")
    assert user.invalid?
  end

  test "it cannot create a user without a password" do
    user = User.new(username: "example")
    assert user.invalid?
  end

  test "it can have many ideas" do
    user = User.create(username: "example", password: "password", password_confirmation: "password")
    idea = user.ideas.create
    assert user.ideas
    assert_includes user.ideas, idea
  end
end
