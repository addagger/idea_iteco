class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :person_id
      t.string :title
      t.text :details
      t.integer :number, :default => 0
      t.string :token
      t.boolean :approved, :default => false
      t.integer :commiters_count, :default => 0
      t.integer :comments_count, :default => 0
      t.integer :votes_up, :default => 0
      t.integer :votes_down, :default => 0
      t.timestamps
    end
    add_index :ideas, :token
    add_index :ideas, :title
  end
end
