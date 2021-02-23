class RecipesController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    recipes = Recipe.all
    render json: recipies.to_json(:except => [:created_at, :updated_at])
  end

  def show
    recipe = Recipe.find_by(id: params[:id])
    render json: recipe.to_json(:except => [:created_at, :updated_at])
  end

  def create
    
    recipe = Recipe.create({
      user_id: params["user"],
      name: params["name"],
      volume: params["batchSize"].to_f,
      instructions: params["instructions"],
      notes: params["notes"]
    })
    
    RecipeStyle.create(recipe_id: recipe.id, style_id: params["style"]["id"])
    params["fermentables"].each {|f| RecipeFermentable.create(recipe_id: recipe.id, fermentable_id: f["id"], amount: f["amount"].to_f)}
    params["hops"].each {|f| RecipeHop.create(recipe_id: recipe.id, hop_id: f["id"], amount: f["amount"].to_f, addition_time: f["additionTime"].to_i, boil_addition: f["boilAddition"])}
    params["yeasts"].each {|f| RecipeYeast.create(recipe_id: recipe.id, yeast_id: f["id"], amount: f["amount"].to_f)}
    
    render json: recipe 
    
  end

  def update

  end

  def destroy

  end
  
  private


end
