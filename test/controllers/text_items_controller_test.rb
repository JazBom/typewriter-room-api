require "test_helper"

class TextItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get text_items_index_url
    assert_response :success
  end

  test "should get create" do
    get text_items_create_url
    assert_response :success
  end

  test "should get show" do
    get text_items_show_url
    assert_response :success
  end

  test "should get update" do
    get text_items_update_url
    assert_response :success
  end

  test "should get destroy" do
    get text_items_destroy_url
    assert_response :success
  end

  test "should get text_item_params" do
    get text_items_text_item_params_url
    assert_response :success
  end
end
