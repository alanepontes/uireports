class Profile::InvitesController < ApplicationController
  before_action :set_profile_invite, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #before_action :set_invite_user, only: [:create]
  #load_and_authorize_resource param_method: :profile_invite_params

  # GET /profile/invites/new
  def new
    @profile_invite = Profile::Invite.new
  end

  # POST /profile/invites
  # POST /profile/invites.json
  def create
    @profile_invite = Profile::Invite.new()
    @profile_invite.email = params[:email]
    @profile_invite.project_id = params[:project_id]
    @profile_invite.user_id = params[:user_id]
    @profile_invite.token = params[:authenticity_token]

    respond_to do |format|
      if @profile_invite.save
        format.html { redirect_to profile_project_path(params[:project_id]), notice: 'Avaliador convidado com sucesso.' }
        format.json { render :show, status: :created, location: @profile_project }
      else
        format.html { redirect_to profile_project_path(params[:project_id]), alert: 'Erro ao enviar convite. Talvez você já convidou essa pessoa.' }
        format.json { render json: @profile_invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile/invites/1
  # DELETE /profile/invites/1.json
  def destroy
    @profile_invite.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Avaliador removido om sucesso'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_invite
      @profile_invite = Profile::Invite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_invite_params
      params.require(:profile_invite).permit(:email)
    end
end