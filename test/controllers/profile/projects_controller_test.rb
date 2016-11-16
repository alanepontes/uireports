require 'test_helper'

class Profile::ProjectsControllerTest < ActionController::TestCase
  setup do
    @profile_project = profile_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_project" do
    assert_difference('Profile::Project.count') do
      post :create, profile_project: { description: @profile_project.description, heuristic_id: @profile_project.heuristic_id, name: @profile_project.name, status: @profile_project.status }
    end

    assert_redirected_to profile_project_path(assigns(:profile_project))
  end

  test "should show profile_project" do
    get :show, id: @profile_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_project
    assert_response :success
  end

  test "should update profile_project" do
    patch :update, id: @profile_project, profile_project: { description: @profile_project.description, heuristic_id: @profile_project.heuristic_id, name: @profile_project.name, status: @profile_project.status }
    assert_redirected_to profile_project_path(assigns(:profile_project))
  end

  test "should destroy profile_project" do
    assert_difference('Profile::Project.count', -1) do
      delete :destroy, id: @profile_project
    end

    assert_redirected_to profile_projects_path
  end
end
