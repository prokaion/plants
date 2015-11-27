class SubPathsController < ApplicationController
  before_action :set_sub_path, only: [:show, :edit, :update, :destroy]

  # GET /admin/sub_paths
  # GET /admin/sub_paths.json
  def index
    @sub_paths = SubPath.all
  end

  # GET /admin/sub_paths/1
  # GET /admin/sub_paths/1.json
  def show
  end

  # GET /admin/sub_paths/new
  # generate many sub_pathes at once
  def new
    @sub_pathes = []
    5.times do
      @sub_pathes << SubPath.new
    end
  end

  # GET /admin/sub_paths/1/edit
  def edit
  end

  # POST /admin/sub_paths
  # POST /admin/sub_paths.json
  def create
    #objects = []
    # persist and set ref_ids
    last_path_object = nil
    params["sub_path_params"].each do |sub_path|

      if( (sub_path["part"].nil? || sub_path["part"] == "")   && (sub_path["path_id"].nil? || sub_path["path_id"] == "") )
        next
      end

      current_path = SubPath.create(sub_path_params(sub_path))
      if(current_path.valid?) # save was successful
        # set id_ref if not the first path_
        current_path.update(id_ref: last_path_object.id) unless last_path_object.nil?
        last_path_object = current_path
      else
        render :new
      end
      
    end

    # set terninate of lastPath_object to true and update
    if( last_path_object.update(terminator: true) )

      redirect_to Path.find(params[:sub_path_params].first[:path_id])
    else
      render :new
    end

=begin    
    @sub_path = SubPath.new(sub_path_params)

    respond_to do |format|
      if @sub_path.save
        format.html { redirect_to @sub_path, notice: 'Sub path was successfully created.' }
        format.json { render :show, status: :created, location: @sub_path }
      else
        format.html { render :new }
        format.json { render json: @sub_path.errors, status: :unprocessable_entity }
      end
    end
=end    
  end

  # PATCH/PUT /admin/sub_paths/1
  # PATCH/PUT /admin/sub_paths/1.json
  def update
    respond_to do |format|
      if @sub_path.update(sub_path_params)
        format.html { redirect_to @sub_path, notice: 'Sub path was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_path }
      else
        format.html { render :edit }
        format.json { render json: @sub_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/sub_paths/1
  # DELETE /admin/sub_paths/1.json
  def destroy
    @sub_path.destroy
    respond_to do |format|
      format.html { redirect_to sub_paths_url, notice: 'Sub path was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_path
      @sub_path = SubPath.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_path_params(my_params)
      my_params.permit(:part, :path_id, :terminator)
      #params.require(:sub_path).permit(:part, :path_id, :terminator, :id_ref)
    end
end
