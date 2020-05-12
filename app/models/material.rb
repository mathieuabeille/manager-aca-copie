class Material < ApplicationRecord
  mount_uploader :invoice, InvoiceUploader, mount_on: :invoice
  has_many :material_comment


end
