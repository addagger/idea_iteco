class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :value
      t.integer :taggings_count
      t.timestamps
    end
    add_index :tags, :value
  end
end
