class CreateProjectsIdeas < ActiveRecord::Migration
  def change
    create_table :projects_ideas do |t|
      t.integer :project_id
      t.integer :idea_id
      t.timestamps
    end
  end
end
