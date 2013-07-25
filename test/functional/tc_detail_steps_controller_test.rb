require 'test_helper'

class TcDetailStepsControllerTest < ActionController::TestCase
  setup do
    @tc_detail_step = tc_detail_steps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tc_detail_steps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tc_detail_step" do
    assert_difference('TcDetailStep.count') do
      post :create, tc_detail_step: { belong_ids: @tc_detail_step.belong_ids, description: @tc_detail_step.description, testcase_id: @tc_detail_step.testcase_id }
    end

    assert_redirected_to tc_detail_step_path(assigns(:tc_detail_step))
  end

  test "should show tc_detail_step" do
    get :show, id: @tc_detail_step
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tc_detail_step
    assert_response :success
  end

  test "should update tc_detail_step" do
    put :update, id: @tc_detail_step, tc_detail_step: { belong_ids: @tc_detail_step.belong_ids, description: @tc_detail_step.description, testcase_id: @tc_detail_step.testcase_id }
    assert_redirected_to tc_detail_step_path(assigns(:tc_detail_step))
  end

  test "should destroy tc_detail_step" do
    assert_difference('TcDetailStep.count', -1) do
      delete :destroy, id: @tc_detail_step
    end

    assert_redirected_to tc_detail_steps_path
  end
end
