class AddTagsToUploadFiles < ActiveRecord::Migration[5.1]
  def change
    add_column :upload_files, :tags, :string
  end
end
