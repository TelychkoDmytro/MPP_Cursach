require "test_helper"

class HobiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hobies_new_url
    assert_response :success
  end

  test "should get edit" do
    get hobies_edit_url
    assert_response :success
  end

  test "should get show" do
    get hobies_show_url
    assert_response :success
  end
end
