class AddFileHashToFileUploads < ActiveRecord::Migration
  def change
    add_column :file_uploads, :file_hash, :string
  end
end
