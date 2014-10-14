class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :permalink
      t.date :date_started
      t.boolean :published, :default => false
      t.integer :ideas_count, :default => 0
      t.integer :commiters_count, :default => 0
      t.integer :comments_count, :default => 0
      t.integer :position, :default => 0
      t.timestamps
    end
    add_index :projects, :title
    add_index :projects, :permalink
  end
end
