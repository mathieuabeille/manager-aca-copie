class Addreferenceforinvoices < ActiveRecord::Migration[6.0]
  def change
    add_reference :invoicelines, :invoice, index: true
    add_reference :invoicelines, :label, index: true
    add_reference :invoices, :client, index: true
  end
end
