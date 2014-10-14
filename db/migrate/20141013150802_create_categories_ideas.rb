class CreateCategoriesIdeas < ActiveRecord::Migration
  def change
    create_table :categories_ideas do |t|
      t.integer :category_id
      t.integer :idea_id
      t.timestamps
    end
  end
end
