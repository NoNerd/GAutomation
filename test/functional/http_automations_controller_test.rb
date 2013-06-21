require 'test_helper'

class HttpAutomationsControllerTest < ActionController::TestCase
  setup do
    @http_automation = http_automations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:http_automations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create http_automation" do
    assert_difference('HttpAutomation.count') do
      post :create, http_automation: { base_id: @http_automation.base_id, description: @http_automation.description, env: @http_automation.env, expect: @http_automation.expect, host_id: @http_automation.host_id, hre_type: @http_automation.hre_type, url_path: @http_automation.url_path }
    end

    assert_redirected_to http_automation_path(assigns(:http_automation))
  end

  test "should show http_automation" do
    get :show, id: @http_automation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @http_automation
    assert_response :success
  end

  test "should update http_automation" do
    put :update, id: @http_automation, http_automation: { base_id: @http_automation.base_id, description: @http_automation.description, env: @http_automation.env, expect: @http_automation.expect, host_id: @http_automation.host_id, hre_type: @http_automation.hre_type, url_path: @http_automation.url_path }
    assert_redirected_to http_automation_path(assigns(:http_automation))
  end

  test "should destroy http_automation" do
    assert_difference('HttpAutomation.count', -1) do
      delete :destroy, id: @http_automation
    end

    assert_redirected_to http_automations_path
  end
end
