require 'test_helper'

class Profile::AnswersControllerTest < ActionController::TestCase
  setup do
    @profile_answer = profile_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_answer" do
    assert_difference('Profile::Answer.count') do
      post :create, profile_answer: { comment: @profile_answer.comment, level: @profile_answer.level, problem: @profile_answer.problem, question_id: @profile_answer.question_id, tela_id: @profile_answer.tela_id, user_id: @profile_answer.user_id }
    end

    assert_redirected_to profile_answer_path(assigns(:profile_answer))
  end

  test "should show profile_answer" do
    get :show, id: @profile_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_answer
    assert_response :success
  end

  test "should update profile_answer" do
    patch :update, id: @profile_answer, profile_answer: { comment: @profile_answer.comment, level: @profile_answer.level, problem: @profile_answer.problem, question_id: @profile_answer.question_id, tela_id: @profile_answer.tela_id, user_id: @profile_answer.user_id }
    assert_redirected_to profile_answer_path(assigns(:profile_answer))
  end

  test "should destroy profile_answer" do
    assert_difference('Profile::Answer.count', -1) do
      delete :destroy, id: @profile_answer
    end

    assert_redirected_to profile_answers_path
  end
end
