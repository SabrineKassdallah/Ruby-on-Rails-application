class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :quantity
      t.boolean :selected
      t.boolean :available

      t.timestamps
    end
  end
end
