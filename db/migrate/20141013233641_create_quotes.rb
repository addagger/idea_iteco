class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :who
      t.text :said
      t.string :when
      t.string :where

      t.timestamps
    end
  end
end
