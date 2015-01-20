class CreateImagings < ActiveRecord::Migration
  def change
    create_table :imagings do |t|
      t.references :image, index: true
      t.references :idea, index: true

      t.timestamps null: false
    end
    add_foreign_key :imagings, :images
    add_foreign_key :imagings, :ideas
  end
end
