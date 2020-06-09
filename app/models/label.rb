class Label < ApplicationRecord
  has_many :invoicelines , dependent: :destroy
  def self.search(search)
    if search
      where("name ILIKE ?",  "%#{search}%")
    else
      all
    end
  end
end
