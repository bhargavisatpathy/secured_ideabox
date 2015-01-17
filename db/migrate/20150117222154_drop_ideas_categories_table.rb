class DropIdeasCategoriesTable < ActiveRecord::Migration
  def up
    drop_table :ideas_categories
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
