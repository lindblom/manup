class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|
      t.string :title
      t.text :body
      t.integer :category_id
      t.string :slug

      t.timestamps
    end
  end
end
