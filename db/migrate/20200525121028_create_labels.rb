class CreateLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :labels do |t|
      t.string :name
      t.string :labeltype
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
