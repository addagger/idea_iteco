class CreatePicas < ActiveRecord::Migration
  def change
    create_table :picas do |t|
      t.string :type
      t.string :resource_type
      t.integer :resource_id
      t.integer :picture_id
      t.timestamps
    end
    add_index :picas, :type
    add_index :picas, :resource_type
  end
end