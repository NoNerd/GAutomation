require 'test_helper'

class TobjectsControllerTest < ActionController::TestCase
  setup do
    @tobject = tobjects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tobjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tobject" do
    assert_difference('Tobject.count') do
      post :create, tobject: { attribute_values: @tobject.attribute_values, description: @tobject.description, label_attributes: @tobject.label_attributes, label_types: @tobject.label_types, syn_name: @tobject.syn_name }
    end

    assert_redirected_to tobject_path(assigns(:tobject))
  end

  test "should show tobject" do
    get :show, id: @tobject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tobject
    assert_response :success
  end

  test "should update tobject" do
    put :update, id: @tobject, tobject: { attribute_values: @tobject.attribute_values, description: @tobject.description, label_attributes: @tobject.label_attributes, label_types: @tobject.label_types, syn_name: @tobject.syn_name }
    assert_redirected_to tobject_path(assigns(:tobject))
  end

  test "should destroy tobject" do
    assert_difference('Tobject.count', -1) do
      delete :destroy, id: @tobject
    end

    assert_redirected_to tobjects_path
  end
end
