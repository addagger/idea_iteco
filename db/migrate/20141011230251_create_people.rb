class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :user_id
      t.string :name
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.integer :ideas_count, :default => 0
      t.timestamps
    end
    add_index :people, :first_name
    add_index :people, :last_name
  end
end
