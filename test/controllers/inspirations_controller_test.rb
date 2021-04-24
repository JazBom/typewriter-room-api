require "test_helper"

class InspirationsControllerTest < ActionDispatch::IntegrationTest
  test "should get inspiration by index" do
    get inspirations_index_url
    assert_response :success
  end

  test "should create inspiration" do
    post inspirations_create_url
    assert_response :success
  end

  test "should show inspiration" do
    get inspirations_show_url
    assert_response :success
  end

  test "should update inspiration" do
    put inspirations_update_url
    assert_response :success
  end

  test "should destroy inspiration" do
    delete inspirations_destroy_url
    assert_response :success
  end

  test "should get inspiration_params" do
    get inspirations_inspiration_params_url
    assert_response :success
  end
end
