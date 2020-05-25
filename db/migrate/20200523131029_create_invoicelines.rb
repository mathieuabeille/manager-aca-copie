class CreateInvoicelines < ActiveRecord::Migration[6.0]
  def change
    create_table :invoicelines do |t|
      t.string :name
      t.string :price
      t.string :quantity

      t.timestamps
    end
  end
end
