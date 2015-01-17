require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  attr_reader :user

  def setup
    @user = User.create(username: "example", password: "password", password_confirmation: "password")
    visit login_path
  end

  test 'cannot login with nil credentials' do
    click_button "Login"
    within('#flash_errors') do
      assert page.has_content?("invalid login")
    end
    assert_equal current_path, login_path
  end

  test 'cannot login with invalid credentials' do
    fill_in "session[username]", with: "example"
    fill_in "session[password]", with: "passwor"
    click_button "Login"
    within('#flash_errors') do
      assert page.has_content?("invalid login")
    end
    assert_equal current_path, login_path
  end

  test 'can login with valid credentials' do
    fill_in "session[username]", with: "example"
    fill_in "session[password]", with: "password"
    click_button "Login"
    within('#banner') do
      assert page.has_content?("Welcome example")
    end
    assert_equal current_path, user_path(user)
  end

  test "registered user can view their profile" do
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit user_path(user)
    within("#banner") do
      assert page.has_content?("Welcome example")
    end
  end

  test "unregistered user cannotview a user's profile" do
    ApplicationController.any_instance.stubs(:current_user).returns(nil)
    visit user_path(user)
    within("#flash_alert") do
      assert page.has_content?("Not authorized")
    end
  end

  test "registered user cannot view other users' profile" do
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    protected_user = User.create(username: "protected",  password: "password", password_confirmation: "password")
    visit user_path(protected_user)
    within("#flash_alert") do
      assert page.has_content?("You are not authorized to access this page")
    end
  end

  test "an admin user can view any user's profile" do
    admin_user = User.create(username: "protected",  password: "password", password_confirmation: "password", role: "admin")
    ApplicationController.any_instance.stubs(:current_user).returns(admin_user)
    visit user_path(user)
    within("#banner") do
      assert page.has_content?("Welcome example")
    end
  end

  

  # test "a registered user can create idea" do
  #   ApplicationController.any_instance.stubs(:current_user).returns(user)
  #   visit user_path(user)
  #   within("#banner") do
  #     assert page.has_content?("Welcome example")
  #   end
  #   fill_in "idea[title]", with: "title1"
  #   fill_in "idea[description]", with: "This is an idea"
  #   click_button "Create"
  #   within("#flash_notice") do
  #     assert page.has_content?("You created a new idea")
  #   end
  # end

end
