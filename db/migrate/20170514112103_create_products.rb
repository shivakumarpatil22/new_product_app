class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.float :product_price
      t.float :selling_price
      t.integer :product_stock
      t.string :product_image

      t.timestamps
    end
  end
end
