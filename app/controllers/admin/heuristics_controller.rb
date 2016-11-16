class Admin::HeuristicsController < ApplicationController
  before_action :set_admin_heuristic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :admin_heuristic_params

  # GET /admin/heuristics
  # GET /admin/heuristics.json
  def index
    @admin_heuristics = Admin::Heuristic.paginate(page: params[:page], per_page: 10)
  end

  # GET /admin/heuristics/1
  # GET /admin/heuristics/1.json
  def show
  end

  # GET /admin/heuristics/new
  def new
    @admin_heuristic = Admin::Heuristic.new
  end

  # GET /admin/heuristics/1/edit
  def edit
  end

  # POST /admin/heuristics
  # POST /admin/heuristics.json
  def create
    @admin_heuristic = Admin::Heuristic.new(admin_heuristic_params)

    respond_to do |format|
      if @admin_heuristic.save
        format.html { redirect_to admin_heuristics_url, notice: 'Heuristica criada com sucesso.' }
        format.json { render :index, status: :created, location: @admin_heuristic }
      else
        format.html { render :new }
        format.json { render json: @admin_heuristic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/heuristics/1
  # PATCH/PUT /admin/heuristics/1.json
  def update
    respond_to do |format|
      if @admin_heuristic.update(admin_heuristic_params)
        format.html { redirect_to admin_heuristics_url, notice: 'Heuristica atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @admin_heuristic }
      else
        format.html { render :edit }
        format.json { render json: @admin_heuristic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/heuristics/1
  # DELETE /admin/heuristics/1.json
  def destroy
    @admin_heuristic.destroy
    respond_to do |format|
      format.html { redirect_to admin_heuristics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_heuristic
      @admin_heuristic = Admin::Heuristic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_heuristic_params
      params.require(:admin_heuristic).permit(:name, :description, :device_id)
    end
end
