require 'test_helper'

class Admin::HeuristicsControllerTest < ActionController::TestCase
  setup do
    @admin_heuristic = admin_heuristics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_heuristics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_heuristic" do
    assert_difference('Admin::Heuristic.count') do
      post :create, admin_heuristic: { description: @admin_heuristic.description, device_is: @admin_heuristic.device_is, name: @admin_heuristic.name }
    end

    assert_redirected_to admin_heuristic_path(assigns(:admin_heuristic))
  end

  test "should show admin_heuristic" do
    get :show, id: @admin_heuristic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_heuristic
    assert_response :success
  end

  test "should update admin_heuristic" do
    patch :update, id: @admin_heuristic, admin_heuristic: { description: @admin_heuristic.description, device_is: @admin_heuristic.device_is, name: @admin_heuristic.name }
    assert_redirected_to admin_heuristic_path(assigns(:admin_heuristic))
  end

  test "should destroy admin_heuristic" do
    assert_difference('Admin::Heuristic.count', -1) do
      delete :destroy, id: @admin_heuristic
    end

    assert_redirected_to admin_heuristics_path
  end
end
