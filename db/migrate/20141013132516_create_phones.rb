class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :country_code
      t.string :number
      t.boolean :fax, :default => false
      t.timestamps
    end
    add_index :phones, :country_code
    add_index :phones, :number
  end
end