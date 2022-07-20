require "test_helper"

class ChallengesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get challenges_index_url
    assert_response :success
  end

  test "should get create" do
    get challenges_create_url
    assert_response :success
  end

  test "should get update" do
    get challenges_update_url
    assert_response :success
  end

  test "should get destroy" do
    get challenges_destroy_url
    assert_response :success
  end
end
