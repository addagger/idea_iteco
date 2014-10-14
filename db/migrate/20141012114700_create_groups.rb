class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title
      t.text :description
      t.string :permalink
      t.string :icon
      t.boolean :published, :default => false
      t.integer :ideas_count, :default => 0
      t.integer :position, :default => 0
      t.timestamps
    end
    add_index :groups, :title
    add_index :groups, :permalink
  end
end
