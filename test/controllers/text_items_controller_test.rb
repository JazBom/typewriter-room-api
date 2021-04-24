require "test_helper"

class TextItemsControllerTest < ActionDispatch::IntegrationTest

  test "should get text_item by index" do
    get text_items_index_url
    assert_response :success
  end

  test "should create text_item" do
    post text_items_create_url
    assert_response :success
  end

  test "should show text_item" do
    get text_items_show_url
    assert_response :success
  end

  test "should update text_item" do
    put text_items_update_url
    assert_response :success
  end

  test "should destroy text_item" do
    delete text_items_destroy_url
    assert_response :success
  end

  test "should get text_item_params" do
    get text_items_text_item_params_url
    assert_response :success
  end
end
