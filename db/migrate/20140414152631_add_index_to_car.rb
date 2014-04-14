class AddIndexToCar < ActiveRecord::Migration
  def change
    add_column :cars, :manufacturer_id, :integer
    add_index :cars, :manufacturer_id
  end
end
