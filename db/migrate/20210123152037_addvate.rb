class Addvate < ActiveRecord::Migration[6.0]
  def change
                add_column :invoicelines, :tva, :integer

  end
end
