class RemoveCategoriesAndChangeEssays < ActiveRecord::Migration
  def change
    # remove categories
    drop_table :categories
    
    # make changes to essays
    remove_column :essays, :category_id
    remove_column :essays, :title
    add_column :essays, :published, :boolean, default: false
    add_index :essays, :slug
  end
end
