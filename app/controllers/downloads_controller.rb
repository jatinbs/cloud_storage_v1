class DownloadsController < ApplicationController

  def download_file
    @file_upload = FileUpload.find_by file_hash: params[:file_hash]
    send_file @file_upload.file_path, :type=>@file_upload.mime_type, :x_sendfile=>true
  end

  def download_page
    if(!request.xhr?)
      @file_upload = FileUpload.find_by file_hash: params[:file_hash]
    else
      render status: 404
    end
  end

end