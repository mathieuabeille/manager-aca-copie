class CreateFilters < ActiveRecord::Migration[6.0]
  def change
    create_table :filters do |t|
      t.string :company
      t.string :type
      t.string :supplier
      t.string :brand
      t.string :localisation

      t.timestamps
    end
  end
end
