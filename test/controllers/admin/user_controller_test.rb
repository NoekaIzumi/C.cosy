require "test_helper"

class Admin::UserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_user_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_user_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_user_edit_url
    assert_response :success
  end

  test "should get favorite" do
    get admin_user_favorite_url
    assert_response :success
  end

  test "should get follow" do
    get admin_user_follow_url
    assert_response :success
  end

  test "should get follower" do
    get admin_user_follower_url
    assert_response :success
  end
end
