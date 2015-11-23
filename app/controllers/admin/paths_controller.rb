class Admin::PathsController < ApplicationController
  before_action :set_admin_path, only: [:show, :edit, :update, :destroy]

  # GET /admin/paths
  # GET /admin/paths.json
  def index
    @admin_paths = Admin::Path.all
  end

  # GET /admin/paths/1
  # GET /admin/paths/1.json
  def show
    puts "here!!!!!!!!!"+ @admin_path.to_s
  end

  # GET /admin/paths/new
  def new
    @admin_path = Admin::Path.new
  end

  # GET /admin/paths/1/edit
  def edit
  end

  # POST /admin/paths
  # POST /admin/paths.json
  def create
    @admin_path = Admin::Path.new(admin_path_params)

    respond_to do |format|
      if @admin_path.save
        format.html { redirect_to @admin_path, notice: 'Path was successfully created.' }
        format.json { render :show, status: :created, location: @admin_path }
      else
        format.html { render :new }
        format.json { render json: @admin_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/paths/1
  # PATCH/PUT /admin/paths/1.json
  def update
    respond_to do |format|
      if @admin_path.update(admin_path_params)
        format.html { redirect_to @admin_path, notice: 'Path was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_path }
      else
        format.html { render :edit }
        format.json { render json: @admin_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/paths/1
  # DELETE /admin/paths/1.json
  def destroy
    @admin_path.destroy
    respond_to do |format|
      format.html { redirect_to admin_paths_url, notice: 'Path was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_path
      @admin_path = Admin::Path.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_path_params
      params.require(:admin_path).permit(:name, :shop_id)
    end
end
