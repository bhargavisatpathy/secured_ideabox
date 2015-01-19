require 'test_helper'

class IdeaTest < ActiveSupport::TestCase

  def valid_attributes
    {
      title:          "title1",
      description:    "this is title1"
    }
  end

  test "it creates an idea" do
    idea = Idea.new(valid_attributes)

    assert idea.valid?
    assert_equal "title1", idea.title
    assert_equal "this is title1", idea.description
  end

  test "it cannot create an idea without a title" do
    idea = Idea.new(description: "This is a description")

    assert idea.invalid?
  end

  test "it belongs to a user" do
    user = User.create(username: "example", password: "password", password_confirmation: "password")
    attributes = valid_attributes.merge(user_id: user.id)
    idea = Idea.create(attributes)
    assert_equal user, idea.user
  end

  test "it has a category" do
    category = Category.create(name: "Category1")
    attributes = valid_attributes.merge(category_id: category.id)
    idea = Idea.create(attributes)
    assert_equal category, idea.category
  end
end
