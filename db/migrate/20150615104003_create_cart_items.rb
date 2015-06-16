class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.references :food, index: true
      t.references :cart, index: true
      t.float :quantity

      t.timestamps null: false
    end
    add_foreign_key :cart_items, :foods
    add_foreign_key :cart_items, :carts
  end
end
