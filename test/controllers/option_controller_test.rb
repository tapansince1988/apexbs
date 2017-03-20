require 'test_helper'

class OptionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get option_index_url
    assert_response :success
  end

  test "should get new" do
    get option_new_url
    assert_response :success
  end

  test "should get show" do
    get option_show_url
    assert_response :success
  end

  test "should get edit" do
    get option_edit_url
    assert_response :success
  end

  test "should get delete" do
    get option_delete_url
    assert_response :success
  end

end
