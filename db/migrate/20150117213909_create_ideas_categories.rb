class CreateIdeasCategories < ActiveRecord::Migration
  def change
    create_table :ideas_categories do |t|
      t.integer :idea_id
      t.integer :category_id
    end
  end
end
