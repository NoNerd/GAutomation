require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get introduction" do
    get :introduction
    assert_response :success
  end

end
