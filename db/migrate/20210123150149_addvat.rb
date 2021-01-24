class Addvat < ActiveRecord::Migration[6.0]
  def change
            add_column :invoicelines, :vat, :integer

  end
end
