require 'test_helper'

class TeststepsControllerTest < ActionController::TestCase
  setup do
    @teststep = teststeps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teststeps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teststep" do
    assert_difference('Teststep.count') do
      post :create, teststep: { call_method: @teststep.call_method, description: @teststep.description, expect: @teststep.expect, input: @teststep.input, obj_name: @teststep.obj_name, run: @teststep.run, step: @teststep.step, step_method: @teststep.step_method, testcase_id: @teststep.testcase_id }
    end

    assert_redirected_to teststep_path(assigns(:teststep))
  end

  test "should show teststep" do
    get :show, id: @teststep
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teststep
    assert_response :success
  end

  test "should update teststep" do
    put :update, id: @teststep, teststep: { call_method: @teststep.call_method, description: @teststep.description, expect: @teststep.expect, input: @teststep.input, obj_name: @teststep.obj_name, run: @teststep.run, step: @teststep.step, step_method: @teststep.step_method, testcase_id: @teststep.testcase_id }
    assert_redirected_to teststep_path(assigns(:teststep))
  end

  test "should destroy teststep" do
    assert_difference('Teststep.count', -1) do
      delete :destroy, id: @teststep
    end

    assert_redirected_to teststeps_path
  end
end
