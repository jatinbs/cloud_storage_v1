class FileUpload < ActiveRecord::Base

  belongs_to :user
  attr_accessor :upload_file
  # validates :user_id, presence:true
  validates :upload_file, presence: true

  before_validation :process_file
  before_save :save_file

  def process_file

    # puts "file_size:" + File.size(self.upload_file.tempfile.path).to_s

    uuid = UUID.new
    file_hash = uuid.generate
    puts self.upload_file

    self.file_name = self.upload_file.original_filename
    self.file_path = "uploads/#{file_hash}"
    self.mime_type = self.upload_file.content_type
    self.file_hash = file_hash
    self.size = File.size(self.upload_file.tempfile.path).to_i
  end

  def save_file
    directory = "uploads/"
    path = File.join(directory, self.file_hash)
    File.open(path, "wb") { |f| f.write(self.upload_file.read)}
  end

  def after_destroy
    File.delete(self.file_path) if File.exist?(self.file_path)
  end

end
