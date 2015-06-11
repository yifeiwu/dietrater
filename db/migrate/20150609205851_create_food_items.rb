class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :name
      t.string :serve_size
      t.string :nut_type
      t.float :nut_size

      t.timestamps null: false
    end
  end
end
