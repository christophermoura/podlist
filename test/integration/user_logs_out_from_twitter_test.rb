require "test_helper"

class UserLogsOutWithTwitterTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = Podlist::Application
    stub_omniauth
    Capybara.current_driver = Capybara.javascript_driver # :selenium by default
  end

  test "logging out" do
    visit "/"
    click_link "LOGIN"

    assert_equal "/home", current_path
    click_link "Logout"
    assert_equal "/", current_path
    assert page.has_link? "LOGIN"
  end
end
