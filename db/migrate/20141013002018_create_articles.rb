class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :type
      t.string :resource_type
      t.integer :resource_id
      t.string :title
      t.text :content
      t.string :icon
      t.boolean :published
      t.integer :position, :default => 0
      t.timestamps
    end
    add_index :articles, :type
    add_index :articles, :resource_type
  end
end
