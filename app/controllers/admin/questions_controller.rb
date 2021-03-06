class Admin::QuestionsController < ApplicationController
  before_action :set_admin_question, only: [:show, :edit, :update, :destroy]
  before_action :get_heuristic
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :admin_question_params

  # GET /admin/questions
  # GET /admin/questions.json
  def index
    @admin_questions = @heuristic.questions.paginate(page: params[:page], per_page: 10)
  end

  # GET /admin/questions/1
  # GET /admin/questions/1.json
  def show
    @admin_question = @heuristic.questions.find(params[:id])
  end

  # GET /admin/questions/new
  def new
    @admin_question = Admin::Question.new
  end

  # GET /admin/questions/1/edit
  def edit
  end

  # POST /admin/questions
  # POST /admin/questions.json
  def create
    @admin_question = @heuristic.questions.new(admin_question_params)

    respond_to do |format|
      if @admin_question.save
        format.html { redirect_to admin_heuristic_questions_path, notice: 'Pergunta criada com sucesso.' }
        format.json { render :show, status: :created, location: admin_heuristic_questions_path }
      else
        format.html { render :new }
        format.json { render json: @admin_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/questions/1
  # PATCH/PUT /admin/questions/1.json
  def update
    respond_to do |format|
      if @admin_question.update(admin_question_params)
        format.html { redirect_to admin_heuristic_questions_path, notice: 'Pergunta atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: admin_heuristic_questions_path }
      else
        format.html { render :edit }
        format.json { render json: @admin_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/questions/1
  # DELETE /admin/questions/1.json
  def destroy
    @admin_question.destroy
    respond_to do |format|
      format.html { redirect_to admin_heuristic_questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_question
      @admin_question = Admin::Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_question_params
      params.require(:admin_question).permit(:name, :description, :heuristic_id)
    end

    def get_heuristic
      @heuristic = Admin::Heuristic.find(params[:heuristic_id])
    end
end
