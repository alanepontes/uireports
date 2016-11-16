class Profile::AnswersController < ApplicationController
  before_action :set_profile_answer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :get_project, only: [:new, :edit, :create, :update, :show, :set_total]
  before_action :get_tela, only: [:new, :edit, :create, :update, :show, :set_total]
  before_action :get_question_position, only: [:create, :new]
  before_action :set_total, only: [:new, :create]

  # GET /profile/answers
  # GET /profile/answers.json
  def index
    @profile_answers = Profile::Answer.all
  end

  # GET /profile/answers/1
  # GET /profile/answers/1.json
  def show
  end

  # GET /profile/answers/new
  def new
    @pergunta = Admin::Question.where("heuristic_id = ? AND position = ?", @project.heuristic.id, params[:p]).first
    @profile_answer = Profile::Answer.new
  end

  # GET /profile/answers/1/edit
  def edit
    @pergunta = Admin::Question.where("heuristic_id = ? AND position = ?", @project.heuristic.id, params[:p]).first
    @telas = Profile::Tela.where( project_id: @project.id )
  end

  # POST /profile/answers
  # POST /profile/answers.json
  def create
    @profile_answer = Profile::Answer.new(profile_answer_params)
    @profile_answer.user_id = current_user.id
    @profile_answer.project_id = @project.id
    @profile_answer.tela_id = @tela.id
    @perguntaid = params[:profile_answer][:p].to_i
    respond_to do |format|
      if @profile_answer.save
        create_evaluation
        if @perguntaid < @p_total
          format.html { redirect_to new_profile_project_tela_answer_path(:tela_id => @tela.id, :p => @perguntaid+1) }
        else
          format.html { redirect_to profile_project_avaliar_path, notice: 'Avaliação completa. Obrigado! :)' }
        end
        format.json { render :show, status: :created, location: @profile_answer }
      else
        format.html { redirect_to new_profile_project_tela_answer_path(:tela_id => @tela.id, :p => @perguntaid), alert: 'Erro. Projeto já avaliado.'}
        format.json { render json: @profile_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def create_evaluation
    @eval = Profile::Evaluation.new
    @eval.user_id = current_user.id
    @eval.project_id = @project.id
    @eval.save
    @eval_check = Profile::Invite.where('user_id = ? AND project_id = ?', current_user.id, @project.id).first
    @eval_check.update_attribute(:status, true)
  end

  # PATCH/PUT /profile/answers/1
  # PATCH/PUT /profile/answers/1.json
  def update
    respond_to do |format|
      if @profile_answer.update(profile_answer_params)
        format.html { redirect_to @profile_answer, notice: 'Respostas atualizadas com sucesso.' }
        format.json { render :show, status: :ok, location: @profile_answer }
      else
        format.html { render :edit }
        format.json { render json: @profile_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile/answers/1
  # DELETE /profile/answers/1.json
  def destroy
    @profile_answer.destroy
    respond_to do |format|
      format.html { redirect_to profile_answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_answer
      @profile_answer = Profile::Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_answer_params
      params.require(:profile_answer).permit(:problem, :level, :comment, :user_id, :question_id, :project_id)
    end

    def get_project
      @project = Profile::Project.find(params[:project_id])
    end

    def get_tela
      @tela = Profile::Tela.find(params[:tela_id])
    end

    def get_question_position
      @q_id = params[:p].to_i
    end

    def set_total
      @p_total = Admin::Question.where(heuristic_id: @project.heuristic.id).count
    end
end
