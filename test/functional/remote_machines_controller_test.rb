require 'test_helper'

class RemoteMachinesControllerTest < ActionController::TestCase
  setup do
    @remote_machine = remote_machines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:remote_machines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create remote_machine" do
    assert_difference('RemoteMachine.count') do
      post :create, remote_machine: { funcscriptpath: @remote_machine.funcscriptpath, ipaddress: @remote_machine.ipaddress, smokescriptpath: @remote_machine.smokescriptpath, status: @remote_machine.status }
    end

    assert_redirected_to remote_machine_path(assigns(:remote_machine))
  end

  test "should show remote_machine" do
    get :show, id: @remote_machine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @remote_machine
    assert_response :success
  end

  test "should update remote_machine" do
    put :update, id: @remote_machine, remote_machine: { funcscriptpath: @remote_machine.funcscriptpath, ipaddress: @remote_machine.ipaddress, smokescriptpath: @remote_machine.smokescriptpath, status: @remote_machine.status }
    assert_redirected_to remote_machine_path(assigns(:remote_machine))
  end

  test "should destroy remote_machine" do
    assert_difference('RemoteMachine.count', -1) do
      delete :destroy, id: @remote_machine
    end

    assert_redirected_to remote_machines_path
  end
end
