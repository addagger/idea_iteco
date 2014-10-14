class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :address
      t.timestamps
    end
    add_index :websites, :address
  end
end