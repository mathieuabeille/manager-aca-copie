class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string :company
      t.string :type
      t.string :supplier
      t.string :name
      t.string :serial
      t.string :number
      t.string :location
      t.string :invoice
      t.timestamps
    end
  end
end
