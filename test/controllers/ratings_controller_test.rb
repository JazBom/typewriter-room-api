require "test_helper"

class RatingsControllerTest < ActionDispatch::IntegrationTest
  test "should get rating by index" do
    get ratings_index_url
    assert_response :success
  end

  test "should create rating" do
    post ratings_create_url
    assert_response :success
  end

  test "should show rating" do
    get ratings_show_url
    assert_response :success
  end

  test "should update rating" do
    put ratings_update_url
    assert_response :success
  end

  test "should destroy rating" do
    delete ratings_destroy_url
    assert_response :success
  end

  test "should get ratings_params" do
    get ratings_ratings_params_url
    assert_response :success
  end
end
