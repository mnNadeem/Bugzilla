require 'test_helper'

class BugsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bugs_index_url
    assert_response :success
  end

  test "should get create" do
    get bugs_create_url
    assert_response :success
  end

  test "should get edit" do
    get bugs_edit_url
    assert_response :success
  end

  test "should get update" do
    get bugs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get bugs_destroy_url
    assert_response :success
  end

end
