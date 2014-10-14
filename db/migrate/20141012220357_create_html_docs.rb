class CreateHtmlDocs < ActiveRecord::Migration
  def change
    create_table :html_docs do |t|
      t.string :resource_type
      t.integer :resource_id
      t.text :content
      t.timestamps
    end
    add_index :html_docs, :resource_type
  end
end
