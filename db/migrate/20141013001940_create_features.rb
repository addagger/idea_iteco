class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.integer :project_id
      t.string :name
      t.text :description
      t.string :icon
      t.integer :position, :default => 0
      t.timestamps
    end
  end
end
