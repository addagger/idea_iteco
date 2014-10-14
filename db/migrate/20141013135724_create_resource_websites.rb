class CreateResourceWebsites < ActiveRecord::Migration
  def change
    create_table :resource_websites do |t|
      t.string :resource_type
      t.integer :resource_id
      t.integer :website_id
      t.integer :position, :default => 0
      t.timestamps
    end
    add_index :resource_websites, :resource_type
  end
end
