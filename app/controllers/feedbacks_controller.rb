class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_feedback_type_position, only: [:create, :new]
  before_action :set_total, only: [:new, :create]

  # GET /profile/answers/new
  def new
    @user_data = User.find(params[:user_id])
    @feedback_type = FeedbackType.where("position = ?", params[:p]).first
    @feedback = Feedback.new
  end

  # GET /profile/answers/1/edit
  def edit
    @user_data = User.find(params[:user_id])
    @feedback_type = FeedbackType.where("position = ?", params[:p]).first
    @feedback = Feedback.new
  end

  # POST /profile/answers
  # POST /profile/answers.json
  def create
    @user_data = User.find(params[:user_id])
    @feedback = Feedback.new(feedback_params)

    @feedback_typeid = params[:feedback][:p].to_i

    @feedback.evaluation_id = params[:evaluation_id]
    respond_to do |format|
      if @feedback.save
        if @feedback_typeid < @p_total
          format.html { redirect_to new_feedback_path(user_id: @user_data.id, p: @feedback_typeid+1) }
        else
          format.html { redirect_to root_path, notice: 'Avaliação completa. Obrigado! :)' }
        end
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { redirect_to new_feedback_path(user_id: @user_data.id, p: @feedback_typeid), alert: @feedback.errors.full_messages.first}
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(:rate, :evaluation_id, :feedback_type_id)
    end

    def get_feedback_type_position
      @q_id = params[:p].to_i
    end

    def set_total
      @p_total = FeedbackType.count
    end
end
