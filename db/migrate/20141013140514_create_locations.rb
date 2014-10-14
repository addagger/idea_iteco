class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :country_code
      t.string :subdivision
      t.string :city
      t.timestamps
    end
    add_index :locations, :country_code
    add_index :locations, :subdivision
    add_index :locations, :city
  end
end
