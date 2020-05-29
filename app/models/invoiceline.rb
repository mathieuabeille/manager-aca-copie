class Invoiceline < ApplicationRecord
  belongs_to :invoice
  belongs_to :label, optional: true
end
