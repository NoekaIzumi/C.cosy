require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_edit_url
    assert_response :success
  end

  test "should get favorite" do
    get user_favorite_url
    assert_response :success
  end

  test "should get follow" do
    get user_follow_url
    assert_response :success
  end

  test "should get follower" do
    get user_follower_url
    assert_response :success
  end
end
