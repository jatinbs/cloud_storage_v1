class FileUploadsController < ApplicationController
  before_action :set_file_upload, only: [:show, :destroy]
  before_action :authenticate?

  # GET /file_uploads
  # GET /file_uploads.json
  def index
    @file_uploads = FileUpload.all
    # @file_uploads = current_user.file_uploads.all
  end

  # GET /file_uploads/1
  # GET /file_uploads/1.json
  def show
  end

  # GET /file_uploads/new
  def new
    @file_upload = FileUpload.new
  end

  # POST /file_uploads
  # POST /file_uploads.json
  def create

    uuid = UUID.new
    file_uuid = uuid.generate
    if save_file(params[:upload_file], file_uuid)
      @file_upload = current_user.file_uploads.build(file_upload_params(params[:upload_file], file_uuid))

      respond_to do |format|
        if @file_upload.save
          format.html { redirect_to @file_upload, notice: 'File was successfully uploaded.' }
          format.json { render :show, status: :created, location: @file_upload }
        else
          format.html { render :new }
          format.json { render json: @file_upload.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /file_uploads/1
  # DELETE /file_uploads/1.json
  def destroy

    @file_upload.destroy
    respond_to do |format|
      format.html { redirect_to file_uploads_url, notice: 'File upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def save_file(og_file, filename)
      directory = "uploads/"
      path = File.join(directory, filename)
      filesize = File.open(path, "wb") { |f| f.write(og_file.read)}
    end


    def set_file_upload
      @file_upload = FileUpload.find(params[:id])
      current_user? @file_upload.user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_upload_params(og_file, filename)
      file_upload_params = {
        file_name: og_file.original_filename,
        file_path: "uploads/#{filename}",
        mime_type: og_file.content_type,
        file_hash: filename
      }
      return file_upload_params
    end
end
