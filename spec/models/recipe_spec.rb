require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:faust) { User.create(name: "Faust") }
  let(:recipe) { Recipe.create(name: "Eggplant Hee Hee", author: faust, difficulty: "beginner", favorite: true) }

  it 'has an author' do
    expect(recipe.author.name).to eq("Faust")
  end

  describe "can change difficulty" do
    it "has a beginner difficulty" do
      expect(recipe.difficulty).to eq("beginner")
    end

  
    it "has an intermediate difficulty" do
      recipe.intermediate! 
      expect(recipe.difficulty).to eq("intermediate")
    end

    it "has an advanced difficulty" do
      recipe.advanced!
      expect(recipe.difficulty).to eq("advanced")
    end

    it "has an expert difficulty" do
      recipe.expert!
      expect(recipe.difficulty).to eq("expert")
    end
  end

  it "is a favorite recipe" do
    expect(recipe.favorite).to be(true)
  end

  it "is not a favorite recipe" do
    recipe.favorite = false
    expect(recipe.favorite).to be(false)
  end

  describe 'favorites scope:' do
    let!(:recipe1) { Recipe.create(author: faust, difficulty: 'expert', name: 'Favorite Recipe', favorite: true) }
    let!(:recipe2) { Recipe.create(author: faust, difficulty: 'expert', name: 'NOT Favorite Recipe', favorite: false) }
    let!(:recipe3) { Recipe.create(author: faust, difficulty: 'expert', name: 'Favorite Recipe 2', favorite: true) }

    it "returns favorite recipes only" do
      expect(Recipe.favorites.pluck(:name)).to include(recipe1.name)
      expect(Recipe.favorites.pluck(:name)).to include(recipe3.name)
    end

    it "excludes non favorite recipes" do
      expect(Recipe.favorites.pluck(:name)).to_not include(recipe2.name)
    end
  end
end
