class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :color, null: false
      t.integer :year, null: false
      t.string :mileage, null: false
      t.text :description
      t.integer :manufacturer_id, null: false

      t.timestamps
    end
  add_index :cars, :manufacturer_id
  end
end
