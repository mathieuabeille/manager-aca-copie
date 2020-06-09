class Addemailinvoice < ActiveRecord::Migration[6.0]
  def change
        add_column :invoices, :email, :string

  end
end
