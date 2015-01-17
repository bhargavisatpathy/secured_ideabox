require 'test_helper'

class UserIdeaTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "a user can create an idea" do
    user = User.create(username: "example", password: "password", password_confirmation: "password")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit user_path(user)
    within("#banner") do
      assert page.has_content?("Welcome example")
    end
    fill_in "idea[title]", with: "title1"
    fill_in "idea[description]", with: "This is an idea"
    click_button "Create"
    within("#flash_notice") do
      assert page.has_content?("You created a new idea")
    end
    assert user.ideas.any?{ |idea| idea.title == "title1"}
  end

  test "an admin user can create a category" do
    admin_user = User.create(username: "protected",  password: "password", password_confirmation: "password", role: "admin")
    ApplicationController.any_instance.stubs(:current_user).returns(admin_user)
    visit user_path(admin_user)
    within("#admin") do
      assert page.has_content?("Welcome protected")
    end
    fill_in "category[name]", with: "category1"
    click_button "Create Category"
    within("#flash_notice") do
      assert page.has_content?("You created a category")
    end
    p categories
    #assert categories.any?{ |category| category.name == "category1"}
  end
end
