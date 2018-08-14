class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.text :name
      t.integer :sku_id
      t.integer :price
      t.date :expiry_date

      t.timestamps
    end
  end
end
