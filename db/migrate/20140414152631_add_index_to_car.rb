class AddIndexToCar < ActiveRecord::Migration
  def change
    add_column :cars, :manufacturer_id, :integer, column_options: {null: false}
    add_index :cars, :manufacturer_id
  end
end
