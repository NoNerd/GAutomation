require 'test_helper'

class EquipControllerTest < ActionController::TestCase
  test "should get uploadify" do
    get :uploadify
    assert_response :success
  end

end
