class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.text :description
      t.string :permalink
      t.string :icon
      t.boolean :published, :default => false
      t.integer :ideas_count, :default => 0
      t.integer :position, :default => 0
      t.timestamps
    end
    add_index :categories, :title
    add_index :categories, :permalink
  end
end
