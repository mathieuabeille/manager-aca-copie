class Folder < ApplicationRecord
  has_many :documents
  accepts_nested_attributes_for :documents, reject_if: :all_blank, allow_destroy: true

end
