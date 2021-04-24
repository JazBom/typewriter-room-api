require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get user by index" do
    get users_index_url
    assert_response :success
  end

  test "should create user" do
    post users_create_url
    assert_response :success
  end

  test "should show user" do
    get users_show_url
    assert_response :success
  end

  test "should update user" do
    put users_update_url
    assert_response :success
  end

  test "should destroy user" do
    delete users_destroy_url
    assert_response :success
  end

end

# Is the response redirected as expected?
# Is the expected template rendered?
# Is the routing as expected?
# Does the response contain the expected tags?
