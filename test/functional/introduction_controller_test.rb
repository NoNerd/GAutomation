require 'test_helper'

class IntroductionControllerTest < ActionController::TestCase
  test "should get usinghttp" do
    get :usinghttp
    assert_response :success
  end

  test "should get usingfunc" do
    get :usingfunc
    assert_response :success
  end

end
