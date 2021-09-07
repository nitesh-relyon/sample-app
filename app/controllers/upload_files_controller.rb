class UploadFilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_file, only: [:show, :edit, :update, :destroy]
 
  def index
    @files = UploadFile.where(user_id: current_user.id).order('created_at DESC')
  end
 
  def show
  end
 
  def new
    @file = UploadFile.new
  end
 
  def create
    @file = UploadFile.new(upload_file_params)
    @file.user_id = current_user.id
    if @file.save
      redirect_to upload_files_path
    else
      render :new
    end
  end
 
  def edit
  end
 
  def update
    if @file.update_attributes(upload_file_params)
      redirect_to upload_files_path(@file)
    else
      render :edit
    end
  end

  def destroy
    @file.destroy
    respond_to do |format|
      format.html { redirect_to upload_files_path, notice: 'File was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def same_tag_files
    file = UploadFile.find_by(id: params[:format])
    @files = UploadFile.where(user_id: current_user.id, tags: file.tags)
  end

  def download_file
    @file = UploadFile.find(params[:id])
    send_file(@file.file.path,
          :filename => @file.file.name,
          :type => @file.file.content_type,
          :disposition => 'attachment',
          :url_based_filename => true)
  end
 
  private
 
  def upload_file_params
    params.require(:upload_file).permit(:tags, :name, :description, :file)
  end
 
  def set_file
    @file = UploadFile.find(params[:id])
  end
end