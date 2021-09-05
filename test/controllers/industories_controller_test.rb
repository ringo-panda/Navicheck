require "test_helper"

class IndustoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get industories_new_url
    assert_response :success
  end

  test "should get create" do
    get industories_create_url
    assert_response :success
  end

  test "should get index" do
    get industories_index_url
    assert_response :success
  end

  test "should get show" do
    get industories_show_url
    assert_response :success
  end

  test "should get edit" do
    get industories_edit_url
    assert_response :success
  end

  test "should get update" do
    get industories_update_url
    assert_response :success
  end

  test "should get destroy" do
    get industories_destroy_url
    assert_response :success
  end
end
