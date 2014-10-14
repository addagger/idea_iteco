class CreateResourceEmails < ActiveRecord::Migration
  def change
    create_table :resource_emails do |t|
      t.string :resource_type
      t.integer :resource_id
      t.integer :email_id
      t.integer :position, :default => 0
      t.timestamps
    end
    add_index :resource_emails, :resource_type
  end
end
