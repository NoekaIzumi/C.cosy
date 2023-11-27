require "test_helper"

class User::RelationshipControllerTest < ActionDispatch::IntegrationTest
  test "should get follow" do
    get user_relationship_follow_url
    assert_response :success
  end

  test "should get unfollow" do
    get user_relationship_unfollow_url
    assert_response :success
  end

  test "should get followed" do
    get user_relationship_followed_url
    assert_response :success
  end

  test "should get unfollowed" do
    get user_relationship_unfollowed_url
    assert_response :success
  end
end
