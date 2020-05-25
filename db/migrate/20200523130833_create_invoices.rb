class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :author
      t.string :status
      t.string :invoicetype
      t.string :name
      t.integer :vat

      t.timestamps
    end
  end
end
