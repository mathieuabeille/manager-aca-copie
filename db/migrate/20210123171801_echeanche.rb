class Echeanche < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :days, :string
    add_column :users, :days, :string
    add_column :users, :siret, :string
    add_column :users, :entreprise, :string
    add_column :users, :address, :string
    add_column :users, :bank, :string

  end
end
