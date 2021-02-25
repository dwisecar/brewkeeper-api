class RecipesController < ApplicationController
  skip_before_action :authorized

  def index
    recipes = Recipe.all
    render json: recipes.to_json(:include => {
      :styles => {:except => [:created_at, :updated_at]},
      :fermentables => {:except => [:created_at, :updated_at]},
      :hops => {:except => [:created_at, :updated_at]},
      :yeasts => {:except => [:created_at, :updated_at]},
      :reviews => {:include => {
          :user => {:only => [:id, :username]},
      }},
      :ratings => {:except => [:created_at, :updated_at]},
      :user => {:except => [:password_digest, :created_at, :updated_at]}
    },
      :except => [:created_at, :updated_at])
  end

  def show
    recipe = Recipe.find_by(id: params[:id])
    render json: recipe.to_json(:include => {
      :styles => {:except => [:created_at, :updated_at]},
      :fermentables => {:except => [:created_at, :updated_at]},
      :hops => {:except => [:created_at, :updated_at]},
      :yeasts => {:except => [:created_at, :updated_at]}
    },
      :except => [:created_at, :updated_at])
  end

  def create
    recipe = Recipe.create(recipe_params)
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

  def recipe_params
    params.require(:recipe).permit(:user_id, :name, :volume, :instructions, :notes)
  end

end
