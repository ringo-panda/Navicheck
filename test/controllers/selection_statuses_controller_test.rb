require "test_helper"

class SelectionStatusesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get selection_statuses_new_url
    assert_response :success
  end

  test "should get create" do
    get selection_statuses_create_url
    assert_response :success
  end

  test "should get index" do
    get selection_statuses_index_url
    assert_response :success
  end

  test "should get show" do
    get selection_statuses_show_url
    assert_response :success
  end

  test "should get edit" do
    get selection_statuses_edit_url
    assert_response :success
  end

  test "should get update" do
    get selection_statuses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get selection_statuses_destroy_url
    assert_response :success
  end
end
