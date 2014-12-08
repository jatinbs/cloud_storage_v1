json.array!(@file_uploads) do |file_upload|
  json.extract! file_upload, :id, :file_name, :user_id, :file_path, :mime_type
  json.url file_upload_url(file_upload, format: :json)
end
