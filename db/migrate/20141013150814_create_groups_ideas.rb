class CreateGroupsIdeas < ActiveRecord::Migration
  def change
    create_table :groups_ideas do |t|
      t.integer :group_id
      t.integer :idea_id
      t.timestamps
    end
  end
end
