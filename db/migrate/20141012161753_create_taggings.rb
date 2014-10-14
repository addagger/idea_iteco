class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.string :resource_type
      t.integer :resource_id
      t.integer :tag_id
      t.timestamps
    end
    add_index :taggings, :resource_type
  end
end
