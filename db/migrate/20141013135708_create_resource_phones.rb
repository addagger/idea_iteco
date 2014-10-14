class CreateResourcePhones < ActiveRecord::Migration
  def change
    create_table :resource_phones do |t|
      t.string :resource_type
      t.integer :resource_id
      t.integer :phone_id
      t.integer :position, :default => 0
      t.timestamps
    end
    add_index :resource_phones, :resource_type
  end
end
