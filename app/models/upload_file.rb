class UploadFile < ApplicationRecord
  belongs_to :user
  mount_uploader :file, FileUploader
end
