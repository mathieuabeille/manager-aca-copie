class Addcolumntomaterial2 < ActiveRecord::Migration[6.0]
  def change
    rename_column :filters, :type, :materialType
    rename_column :filters, :localisation, :location
  end
end
