class Document < ApplicationRecord
  mount_uploader :document, DocumentUploader, mount_on: :document

  belongs_to :folder

end
