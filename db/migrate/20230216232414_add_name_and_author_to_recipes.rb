class AddNameAndAuthorToRecipes < ActiveRecord::Migration[7.0]
  def change
     add_column :recipes, :author_id, :bigint
     add_index :recipes, :author_id
     add_column :recipes, :name, :text
  end
end
