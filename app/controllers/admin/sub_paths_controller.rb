class Admin::SubPathsController < ApplicationController
  before_action :set_admin_sub_path, only: [:show, :edit, :update, :destroy]

  # GET /admin/sub_paths
  # GET /admin/sub_paths.json
  def index
    @admin_sub_paths = Admin::SubPath.all
  end

  # GET /admin/sub_paths/1
  # GET /admin/sub_paths/1.json
  def show
  end

  # GET /admin/sub_paths/new
  def new
    @admin_sub_path = Admin::SubPath.new
  end

  # GET /admin/sub_paths/1/edit
  def edit
  end

  # POST /admin/sub_paths
  # POST /admin/sub_paths.json
  def create
    @admin_sub_path = Admin::SubPath.new(admin_sub_path_params)

    respond_to do |format|
      if @admin_sub_path.save
        format.html { redirect_to @admin_sub_path, notice: 'Sub path was successfully created.' }
        format.json { render :show, status: :created, location: @admin_sub_path }
      else
        format.html { render :new }
        format.json { render json: @admin_sub_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/sub_paths/1
  # PATCH/PUT /admin/sub_paths/1.json
  def update
    respond_to do |format|
      if @admin_sub_path.update(admin_sub_path_params)
        format.html { redirect_to @admin_sub_path, notice: 'Sub path was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_sub_path }
      else
        format.html { render :edit }
        format.json { render json: @admin_sub_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/sub_paths/1
  # DELETE /admin/sub_paths/1.json
  def destroy
    @admin_sub_path.destroy
    respond_to do |format|
      format.html { redirect_to admin_sub_paths_url, notice: 'Sub path was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_sub_path
      @admin_sub_path = Admin::SubPath.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_sub_path_params
      params.require(:admin_sub_path).permit(:part, :path_id, :terminator, :id_ref)
    end
end
