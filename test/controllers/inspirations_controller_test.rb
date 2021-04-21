require "test_helper"

class InspirationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inspirations_index_url
    assert_response :success
  end

  test "should get create" do
    get inspirations_create_url
    assert_response :success
  end

  test "should get show" do
    get inspirations_show_url
    assert_response :success
  end

  test "should get update" do
    get inspirations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get inspirations_destroy_url
    assert_response :success
  end

  test "should get inspiration_params" do
    get inspirations_inspiration_params_url
    assert_response :success
  end
end
