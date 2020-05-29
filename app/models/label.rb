class Label < ApplicationRecord
  has_many :invoicelines , dependent: :destroy

end
