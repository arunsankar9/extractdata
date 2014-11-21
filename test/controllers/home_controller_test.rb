require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get extract_data" do
    get :extract_data
    assert_response :success
  end

end
