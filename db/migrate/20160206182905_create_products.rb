class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_type
      t.decimal :price
      t.string :image
      t.integer :brand_id

      t.timestamps
    end
  end
end
