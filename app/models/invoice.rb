class Invoice < ApplicationRecord
  has_many :invoicelines, dependent: :destroy
  belongs_to :client

  def client_name
    client.try(:name)
  end

  def client_name=(name)
    self.client = Client.find_by_name(name) if name.present?
  end
end
