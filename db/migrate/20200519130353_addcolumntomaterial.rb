class Addcolumntomaterial < ActiveRecord::Migration[6.0]
  def change
    add_column :materials, :brand, :string
  end
end
