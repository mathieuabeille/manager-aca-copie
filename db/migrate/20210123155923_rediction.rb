class Rediction < ActiveRecord::Migration[6.0]
  def change
          add_column :clients, :lastinvoice, :integer

  end
end
