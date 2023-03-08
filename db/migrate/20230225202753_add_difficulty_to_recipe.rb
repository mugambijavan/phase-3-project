class AddDifficultyToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :difficulty, :integer
  end
end
