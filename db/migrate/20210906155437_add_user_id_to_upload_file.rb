class AddUserIdToUploadFile < ActiveRecord::Migration[5.1]
  def change
    add_reference :upload_files, :user, foreign_key: true
  end
end
