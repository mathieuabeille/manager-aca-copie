class RenameTypeMaterial < ActiveRecord::Migration[6.0]
  def change
    rename_column :materials, :type, :materialType

  end
end
