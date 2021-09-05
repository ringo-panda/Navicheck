require "test_helper"

class JobCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get job_categories_new_url
    assert_response :success
  end

  test "should get create" do
    get job_categories_create_url
    assert_response :success
  end

  test "should get index" do
    get job_categories_index_url
    assert_response :success
  end

  test "should get show" do
    get job_categories_show_url
    assert_response :success
  end

  test "should get edit" do
    get job_categories_edit_url
    assert_response :success
  end

  test "should get update" do
    get job_categories_update_url
    assert_response :success
  end

  test "should get destroy" do
    get job_categories_destroy_url
    assert_response :success
  end
end
