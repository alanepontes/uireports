class Profile::ProjectsController < ApplicationController
  before_action :set_profile_project, only: [:show, :edit, :update, :destroy]
  before_action :get_project, only: [:invite, :tela, :avaliar, :resultado, :create_evaluation]
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :profile_project_params

  # GET /profile/projects
  # GET /profile/projects.json
  def index
    @profile_projects = Profile::Project.select('profile_projects.*, COUNT(profile_evaluations.id) AS num_eval').joins('LEFT OUTER JOIN profile_evaluations ON profile_evaluations.project_id = profile_projects.id').group('profile_projects.id').where(user_id: current_user.id).paginate(page: params[:page], per_page: 10).order("created_at DESC")
  end

  def para_avaliar
    @avaliacao_projects = Profile::Invite.select('profile_invites.*, profile_projects.status').joins('LEFT OUTER JOIN profile_projects ON profile_invites.project_id = profile_projects.id').where('profile_invites.user_id = ? AND profile_projects.status = ?', current_user.id, 1).paginate(page: params[:page], per_page: 10).order("created_at DESC")
  end

  def avaliar
    @telas = Profile::Tela.where( project_id: @project.id )
  end

  def resultado
    @telas = Profile::Tela.where( project_id: @project.id )
  end

  # GET /profile/projects/1
  # GET /profile/projects/1.json
  def show
    @avaliac = Profile::Evaluation.where(project_id: params[:id]).count
    @avaliadores = Profile::Invite.where( project_id: params[:id] )
    @telas = Profile::Tela.where( project_id: params[:id] )
  end

  def invite
    if params[:q].present?
      @users = User.where("(name LIKE ? OR email LIKE ?) AND (admin = ?) AND (users.id <> ?)", "%#{params[:q]}%", "%#{params[:q]}%", false, current_user.id).paginate(page: params[:page], per_page: 15).order("created_at DESC")
    else
      @users = User.where("(admin = ?) AND (users.id <> ?)", false, current_user.id).paginate(page: params[:page], per_page: 15).order("created_at DESC") 
    end
  end

  # GET /profile/projects/new
  def new
    @profile_project = Profile::Project.new
  end

  # GET /profile/projects/1/edit
  def edit
  end

  # POST /profile/projects
  # POST /profile/projects.json
  def create
    @profile_project = Profile::Project.new(profile_project_params)
    @profile_project.user_id = current_user.id
    respond_to do |format|
      if @profile_project.save
        format.html { redirect_to @profile_project, notice: 'Projeto criado com sucesso.' }
        format.json { render :show, status: :created, location: @profile_project }
      else
        format.html { render :new }
        format.json { render json: @profile_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile/projects/1
  # PATCH/PUT /profile/projects/1.json
  def update
    respond_to do |format|
      if @profile_project.update(profile_project_params)
        format.html { redirect_to @profile_project, notice: 'Projeto atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @profile_project }
      else
        format.html { render :edit }
        format.json { render json: @profile_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile/projects/1
  # DELETE /profile/projects/1.json
  def destroy
    @profile_project.destroy
    respond_to do |format|
      format.html { redirect_to profile_projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_project
      @profile_project = Profile::Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_project_params
      params.require(:profile_project).permit(:name, :description, :status, :heuristic_id)
    end

    def get_project
      @project = Profile::Project.find(params[:project_id])
    end
end