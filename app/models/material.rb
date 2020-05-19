class Material < ApplicationRecord
  mount_uploader :invoice, InvoiceUploader, mount_on: :invoice
  has_many :material_comment
def self.search(search)
  if search
    where("name ILIKE ? OR location ILIKE ? OR brand ILIKE ? OR supplier ILIKE ?  OR serial ILIKE ?  OR company ILIKE ?    OR number ILIKE ?",  "%#{search}%",  "%#{search}%", "%#{search}%","%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  else
    all
  end
end

end

