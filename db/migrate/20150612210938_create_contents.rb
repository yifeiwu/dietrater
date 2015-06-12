class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :nut_type
      t.float :nut_size
      t.references :food, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
