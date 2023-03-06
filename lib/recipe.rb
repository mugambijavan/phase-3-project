require 'sqlite3'

class Recipe
  attr_reader :id
  attr_accessor :name, :ingredients, :instructions, :video_url
  
  def initialize(name, ingredients, instructions, video_url, id=nil)
    @name = name
    @ingredients = ingredients
    @instructions = instructions
    @video_url = video_url
    @id = id
  end

  def self.all
    db = SQLite3::Database.new('db/recipes.db')
    db.results_as_hash = true
    recipes = db.execute("SELECT * FROM recipes")
    recipes.map { |recipe| Recipe.new(recipe['name'], recipe['ingredients'], recipe['instructions'], recipe['video_url'], recipe['id']) }
  end

  def self.find(id)
    db = SQLite3::Database.new('db/recipes.db')
    db.results_as_hash = true
    recipe = db.execute("SELECT * FROM recipes WHERE id = ?", id).first
    Recipe.new(recipe['name'], recipe['ingredients'], recipe['instructions'], recipe['video_url'], recipe['id'])
  end

  def save
    db = SQLite3::Database.new('db/recipes.db')
    db.execute("INSERT INTO recipes (name, ingredients, instructions, video_url) VALUES (?, ?, ?, ?)", @name, @ingredients, @instructions, @video_url)
    @id = db.last_insert_row_id
  end

  def update
    db = SQLite3::Database.new('db/recipes.db')
    db.execute("UPDATE recipes SET name = ?, ingredients = ?, instructions = ?, video_url = ? WHERE id = ?", @name, @ingredients, @instructions, @video_url, @id)
  end

  def delete
    db = SQLite3::Database.new('db/recipes.db')
    db.execute("DELETE FROM recipes WHERE id = ?", @id)
  end
end
