require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  attr_reader :user

  def setup
    @user = User.create(username: "example", password: "password", password_confirmation: "password")
    visit login_path
  end

  test 'can logout' do
    fill_in "session[username]", with: "example"
    fill_in "session[password]", with: "password"
    click_button "Login"
    within('#banner') do
      assert page.has_content?("Welcome example")
    end
    click_link_or_button "Logout"
    within('#flash_alert') do
      assert page.has_content?("Your session has ended")
    end
    assert current_path, login_path
  end
end
