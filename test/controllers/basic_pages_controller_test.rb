require "test_helper"

class BasicPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get basic_pages_home_url
    assert_response :success
  end

  test "should get team" do
    get basic_pages_team_url
    assert_response :success
  end

  test "should get contact" do
    get basic_pages_contact_url
    assert_response :success
  end

  test "should get welcome" do
    get basic_pages_welcome_url
    assert_response :success
  end
end
