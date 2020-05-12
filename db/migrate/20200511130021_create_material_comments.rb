class CreateMaterialComments < ActiveRecord::Migration[6.0]
  def change
    create_table :material_comments do |t|
      t.string :author
      t.text :comment
      t.references :material, null: false, foreign_key: true

      t.timestamps
    end
  end
end
