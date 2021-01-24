class Invoice < ApplicationRecord
  has_many :invoicelines, dependent: :destroy
  belongs_to :client, optional: true
    def self.search(search)
    if search
      where("name ILIKE ?",  "%#{search}%")
    else
      all
    end
  end
end
