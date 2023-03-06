require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/flash'
require 'sqlite3'

require_relative 'models/recipe'
require_relative 'models/youtube'

enable :sessions

# Set up the database connection
before do
  @db = SQLite3::Database.new('recipes.db')
  @db.results_as_hash = true
end

after do
  @db.close
end

# Define routes for the app
get '/' do
  @recipes = Recipe.all(@db)
  erb :index
end

get '/recipes' do
  @recipes = Recipe.all(@db)
  erb :all_recipes
end

get '/recipes/:id' do
  @recipe = Recipe.find(params[:id].to_i, @db)
  if @recipe
    erb :recipe
  else
    flash[:error] = 'Recipe not found'
    redirect '/'
  end
end

get '/search' do
  @recipes = Recipe.search(params[:query], @db)
  erb :search
end

post '/favorites/:id' do
  id = params[:id].to_i
  if session[:favorites].include?(id)
    flash[:error] = 'Recipe already in favorites'
  else
    session[:favorites] << id
    flash[:notice] = 'Recipe added to favorites'
  end
  redirect "/recipes/#{id}"
end

get '/favorites' do
  @recipes = Recipe.find_by_ids(session[:favorites], @db)
  erb :favorites
end

get '/youtube/:query' do
  @videos = Youtube.search(params[:query])
  erb :youtube
end
