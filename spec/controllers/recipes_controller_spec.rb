require "rails_helper"

RSpec.describe RecipesController, type: :controller do
  let!(:user) do 
    User.create(
      name: "foosta", 
      email: "foosta@bubba.com", 
      password: "foosta", 
      password_confirmation: "foosta"
    ) 
  end
    let!(:recipe) do 
      Recipe.create(
        name: "Eggplant Hee Hee", 
        description: "something", 
        difficulty: "beginner",
        author: user
      ) 
    end
  
  describe "index action" do  
    it "renders the :index view" do
      get :index
      expect(response).to render_template "recipes/index"
    end
  end

  describe "show action" do
    it "renders the :show view" do
      get :show, params: { id: recipe.id }
      expect(response).to render_template "recipes/show"
    end
  end
end
