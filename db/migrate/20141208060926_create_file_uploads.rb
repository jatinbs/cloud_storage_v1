class CreateFileUploads < ActiveRecord::Migration
  def change
    create_table :file_uploads do |t|
      t.string :file_name
      t.integer :user_id
      t.string :file_path
      t.string :mime_type

      t.timestamps
    end
  end
end
