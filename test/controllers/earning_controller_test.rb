require 'test_helper'

class EarningControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get earning_index_url
    assert_response :success
  end

  test "should get show" do
    get earning_show_url
    assert_response :success
  end

end
