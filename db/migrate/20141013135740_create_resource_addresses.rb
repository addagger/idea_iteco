class CreateResourceAddresses < ActiveRecord::Migration
  def change
    create_table :resource_addresses do |t|
      t.string :resource_type
      t.integer :resource_id
      t.integer :address_id
      t.integer :position, :default => 0
      t.timestamps
    end
    add_index :resource_addresses, :resource_type
  end
end
