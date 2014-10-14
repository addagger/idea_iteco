class CreateGroupsProjects < ActiveRecord::Migration
  def change
    create_table :groups_projects do |t|
      t.integer :group_id
      t.integer :project_id
      t.timestamps
    end
  end
end
