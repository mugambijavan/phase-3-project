require_relative '../models/recipe'
require_relative '../models/ingredient'
require_relative '../models/user'
require_relative '../models/recipe_ingredient'
require_relative '../models/favorite_recipe'

# Create sample users
User.create(username: 'user1', password: 'password1')
User.create(username: 'user2', password: 'password2')

# Create sample ingredients
Ingredient.create(name: 'Chicken')
Ingredient.create(name: 'Tomatoes')
Ingredient.create(name: 'Pasta')
Ingredient.create(name: 'Garlic')
Ingredient.create(name: 'Onions')

# Create sample recipes
spaghetti = Recipe.create(
  name: 'Spaghetti with tomato sauce',
  description: 'Classic Italian dish with tomato sauce',
  instructions: 'Cook spaghetti in boiling water. Heat tomato sauce in a pan. Drain spaghetti and add to the sauce. Serve hot.'
)

chicken_pasta = Recipe.create(
  name: 'Chicken pasta with garlic and onions',
  description: 'Pasta dish with chicken, garlic, and onions',
  instructions: 'Cook pasta in boiling water. Saute chicken, garlic, and onions in a pan. Add cooked pasta to the pan and toss. Serve hot.'
)

# Associate ingredients with recipes
RecipeIngredient.create(recipe_id: spaghetti.id, ingredient_id: Ingredient.find_by(name: 'Tomatoes').id)
RecipeIngredient.create(recipe_id: spaghetti.id, ingredient_id: Ingredient.find_by(name: 'Pasta').id)
RecipeIngredient.create(recipe_id: spaghetti.id, ingredient_id: Ingredient.find_by(name: 'Garlic').id)

RecipeIngredient.create(recipe_id: chicken_pasta.id, ingredient_id: Ingredient.find_by(name: 'Pasta').id)
RecipeIngredient.create(recipe_id: chicken_pasta.id, ingredient_id: Ingredient.find_by(name: 'Chicken').id)
RecipeIngredient.create(recipe_id: chicken_pasta.id, ingredient_id: Ingredient.find_by(name: 'Garlic').id)
RecipeIngredient.create(recipe_id: chicken_pasta.id, ingredient_id: Ingredient.find_by(name: 'Onions').id)

# Create favorite recipes for users
FavoriteRecipe.create(user_id: User.first.id, recipe_id: spaghetti.id)
FavoriteRecipe.create(user_id: User.first.id, recipe_id: chicken_pasta.id)
FavoriteRecipe.create(user_id: User.last.id, recipe_id: spaghetti.id)
