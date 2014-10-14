class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :type
      t.string :resource_type
      t.integer :resource_id
      t.string :origin
      t.text :description
      t.integer :used_count, :default => 0
      t.timestamps
    end
    add_attachment :uploads, :src
    add_index :uploads, :type
    add_index :uploads, :resource_type
  end
end
