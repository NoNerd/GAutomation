require 'test_helper'

class ResultControllerTest < ActionController::TestCase
  test "should get show_task" do
    get :show_task
    assert_response :success
  end

end
