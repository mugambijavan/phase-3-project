class AddFavoriteToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :favorite, :boolean, default: false, null: false
  end
end
