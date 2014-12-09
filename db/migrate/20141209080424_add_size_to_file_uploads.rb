class AddSizeToFileUploads < ActiveRecord::Migration
  def change
    add_column :file_uploads, :size, :integer
  end
end
