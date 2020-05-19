class Addcolumntomaterial3 < ActiveRecord::Migration[6.0]
  def change
    rename_column :materials, :materialType, :materialtype
    rename_column :filters, :materialType, :materialtype

  end
end
