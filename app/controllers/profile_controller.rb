class ProfileController < ApplicationController
  include ProfileHelper
  before_action :authenticate_user!

  load_and_authorize_resource param_method: :index
  skip_authorize_resource :only => :faq

  def index
  	if params[:user]
  		@user_data = User.where(id: params[:user]).first
      @user_projects = Profile::Project.select('profile_projects.*, COUNT(profile_evaluations.id) AS num_eval').joins('LEFT OUTER JOIN profile_evaluations ON profile_evaluations.project_id = profile_projects.id').group('profile_projects.id').where(user_id: params[:user]).order('created_at DESC').limit(3)
      @user_avaliac = Profile::Evaluation.where(user_id: params[:user])
      @rating = Rating.where(user_id: params[:user], evaluator_id: current_user.id).first
      @feedback = feedback_average(@user_data).first
      unless @rating
        @rating = Rating.create(user_id: params[:user], evaluator_id: current_user.id, score: 0)
      end
  	else
  		@user_data = User.where(id: current_user.id).first
      @user_projects = Profile::Project.select('profile_projects.*, COUNT(profile_evaluations.id) AS num_eval').joins('LEFT OUTER JOIN profile_evaluations ON profile_evaluations.project_id = profile_projects.id').group('profile_projects.id').where(user_id: current_user.id).order('created_at DESC').limit(6)
      @user_avaliac = Profile::Evaluation.where(user_id: current_user.id)
      @rating = Rating.where(user_id: current_user.id).first
      @feedback = feedback_average(@user_data).first
      unless @rating
        @rating = Rating.create(user_id: current_user.id, score: 0)
      end
  	end
  end

  def faq

  end

end
