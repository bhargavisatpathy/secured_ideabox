require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "it creates a category" do
    category = Category.new(name: "category1")

    assert category.valid?
    assert_equal "category1", category.name
  end

  test "it cannot create a category without a name" do
    category = Category.new

    assert category.invalid?
  end

  test "it can have many ideas" do
    category = Category.create(name: "category1")
    idea = category.ideas.create
    assert category.ideas
    assert_includes category.ideas, idea
  end
end
