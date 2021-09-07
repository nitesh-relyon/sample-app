class CreateUploadFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :upload_files do |t|
      t.string :name
      t.text :description
      t.string :file

      t.timestamps
    end
  end
end
