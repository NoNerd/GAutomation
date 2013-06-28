require 'test_helper'

class UrlPerformancesControllerTest < ActionController::TestCase
  setup do
    @url_performance = url_performances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:url_performances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create url_performance" do
    assert_difference('UrlPerformance.count') do
      post :create, url_performance: { browser: @url_performance.browser, runflag: @url_performance.runflag, url: @url_performance.url }
    end

    assert_redirected_to url_performance_path(assigns(:url_performance))
  end

  test "should show url_performance" do
    get :show, id: @url_performance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @url_performance
    assert_response :success
  end

  test "should update url_performance" do
    put :update, id: @url_performance, url_performance: { browser: @url_performance.browser, runflag: @url_performance.runflag, url: @url_performance.url }
    assert_redirected_to url_performance_path(assigns(:url_performance))
  end

  test "should destroy url_performance" do
    assert_difference('UrlPerformance.count', -1) do
      delete :destroy, id: @url_performance
    end

    assert_redirected_to url_performances_path
  end
end
