class Profile::TelasController < ApplicationController
  before_action :set_profile_tela, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :get_project, only: [:new, :edit, :create, :update, :show, :relatorio]
  before_action :get_tela, only: :relatorio

  # GET /profile/telas
  # GET /profile/telas.json
  def index
    @telas = Profile::Tela.all
  end

  # GET /profile/telas/1
  # GET /profile/telas/1.json
  def show
  end

  def relatorio
    @resultados = Profile::Answer.where(tela_id: @tela.id).order("question_id ASC")
    @result_problema = Profile::Answer.where(tela_id: @tela.id).group(:problem).count
    @result_tipos = Profile::Answer.joins('LEFT OUTER JOIN admin_questions ON profile_answers.question_id = admin_questions.id').where('tela_id = ? AND problem = ?', @tela.id, true).group('admin_questions.name').count
    @result_gravidade = Profile::Answer.where(tela_id: @tela.id).group(:level).count
    @score = Profile::Answer.where(tela_id: @tela.id).average(:level)
    if @score.nil?
      @nota = 0
    else  
      @nota = 4 - @score.to_f
    end 
    #@resultados = Profile::Answer.select('profile_answers.*, admin_questions.*').joins('INNER JOIN admin_questions ON profile_answers.question_id = admin_questions.id').order('created_at DESC')
  end

  # GET /profile/telas/new
  def new
    @tela = Profile::Tela.new
  end

  # GET /profile/telas/1/edit
  def edit
  end

  # POST /profile/telas
  # POST /profile/telas.json
  def create
    @tela = Profile::Tela.new(profile_tela_params)
    @tela.project_id = params[:project_id]
    respond_to do |format|
      if @tela.save
        format.html { redirect_to profile_project_path(@project), notice: 'Tela criada com sucesso.' }
        format.json { render :show, status: :created, location: @tela }
      else
        format.html { render :new }
        format.json { render json: @tela.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile/telas/1
  # PATCH/PUT /profile/telas/1.json
  def update
    respond_to do |format|
      if @tela.update(profile_tela_params)
        format.html { redirect_to profile_project_path(@project), notice: 'Tela atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @tela }
      else
        format.html { render :edit }
        format.json { render json: @tela.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile/telas/1
  # DELETE /profile/telas/1.json
  def destroy
    @tela.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Tela deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_tela
      @tela = Profile::Tela.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_tela_params
      params.require(:profile_tela).permit(:tela, :project_id, :description)
    end

    def get_project
      @project = Profile::Project.find(params[:project_id])
    end

    def get_tela
      @tela = Profile::Tela.find(params[:tela_id])      
    end
end
