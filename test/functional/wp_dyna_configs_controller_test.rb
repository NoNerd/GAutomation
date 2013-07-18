require 'test_helper'

class WpDynaConfigsControllerTest < ActionController::TestCase
  setup do
    @wp_dyna_config = wp_dyna_configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wp_dyna_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wp_dyna_config" do
    assert_difference('WpDynaConfig.count') do
      post :create, wp_dyna_config: { circulate: @wp_dyna_config.circulate, interval_hour: @wp_dyna_config.interval_hour, start_time: @wp_dyna_config.start_time }
    end

    assert_redirected_to wp_dyna_config_path(assigns(:wp_dyna_config))
  end

  test "should show wp_dyna_config" do
    get :show, id: @wp_dyna_config
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wp_dyna_config
    assert_response :success
  end

  test "should update wp_dyna_config" do
    put :update, id: @wp_dyna_config, wp_dyna_config: { circulate: @wp_dyna_config.circulate, interval_hour: @wp_dyna_config.interval_hour, start_time: @wp_dyna_config.start_time }
    assert_redirected_to wp_dyna_config_path(assigns(:wp_dyna_config))
  end

  test "should destroy wp_dyna_config" do
    assert_difference('WpDynaConfig.count', -1) do
      delete :destroy, id: @wp_dyna_config
    end

    assert_redirected_to wp_dyna_configs_path
  end
end
