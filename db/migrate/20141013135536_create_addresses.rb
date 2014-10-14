class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :location_id
      t.string :zip_code
      t.string :street
      t.timestamps
    end
    add_index :addresses, :zip_code
    add_index :addresses, :street
  end
end
