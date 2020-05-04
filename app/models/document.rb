class Document < ApplicationRecord
  mount_uploader :document, DocumentUploader, mount_on: :document
    cached_file_for :document

  belongs_to :folder

end
