require "test_helper"

class User::FavoriteControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_favorite_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_favorite_destroy_url
    assert_response :success
  end
end
