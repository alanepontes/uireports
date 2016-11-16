require 'test_helper'

class Profile::TelasControllerTest < ActionController::TestCase
  setup do
    @profile_tela = profile_telas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_telas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_tela" do
    assert_difference('Profile::Tela.count') do
      post :create, profile_tela: { project_id: @profile_tela.project_id, tela: @profile_tela.tela }
    end

    assert_redirected_to profile_tela_path(assigns(:profile_tela))
  end

  test "should show profile_tela" do
    get :show, id: @profile_tela
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_tela
    assert_response :success
  end

  test "should update profile_tela" do
    patch :update, id: @profile_tela, profile_tela: { project_id: @profile_tela.project_id, tela: @profile_tela.tela }
    assert_redirected_to profile_tela_path(assigns(:profile_tela))
  end

  test "should destroy profile_tela" do
    assert_difference('Profile::Tela.count', -1) do
      delete :destroy, id: @profile_tela
    end

    assert_redirected_to profile_telas_path
  end
end
