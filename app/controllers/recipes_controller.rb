class RecipesController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def index
    recipes = Recipe.all.reverse
    render json: recipes.to_json(:include => {
      :styles => {:only => [:id, :name, :image]},
      :recipe_fermentables => {:except => [:created_at, :updated_at]},
      :recipe_hops => {:except => [:created_at, :updated_at]},
      :recipe_yeasts => {:except => [:created_at, :updated_at]},
      :ratings => {:except => [:created_at, :updated_at]},
      :user => {:only => [:username]}
    },
      :except => [:updated_at],
      :methods => [:average_rating])
  end

  def show
    recipe = Recipe.find_by(id: params[:id])
    render json: recipe.to_json(:include => {
      :styles => {:except => [:created_at, :updated_at]},
      :reviews => {:include => {
          :user => {:only => [:id, :username]},
      }},
      :recipe_fermentables => {:include => {
          :fermentable => {:except => [:created_at, :updated_at]},
      }},
      :recipe_hops => {:include => {
          :hop => {:except => [:created_at, :updated_at]},
      }},
      :recipe_yeasts => {:include => {
          :yeast => {:except => [:created_at, :updated_at]},
      }},
      :ratings => {:except => [:created_at, :updated_at]},
      :user => {:only => [:id, :username]}
    },
      :except => [:created_at, :updated_at],
      :methods => [:average_rating])
  end

  def create   
    recipe = Recipe.create(recipe_params)
    RecipeStyle.create(recipe_id: recipe.id, style_id: params["style"]["id"])
    params["fermentables"].each {|f| RecipeFermentable.create(recipe_id: recipe.id, fermentable_id: f["id"], amount: f["amount"].to_f)}
    params["hops"].each {|f| RecipeHop.create(recipe_id: recipe.id, hop_id: f["id"], amount: f["amount"].to_f, addition_time: f["additionTime"].to_i, boil_addition: f["boilAddition"])}
    params["yeasts"].each {|f| RecipeYeast.create(recipe_id: recipe.id, yeast_id: f["id"], amount: f["amount"].to_f)}
    render json: recipe.to_json(:include => {
      :styles => {:except => [:created_at, :updated_at]},
      :recipe_fermentables => {:except => [:created_at, :updated_at]},
      :recipe_hops => {:except => [:created_at, :updated_at]},
      :recipe_yeasts => {:except => [:created_at, :updated_at]},
      :ratings => {:except => [:created_at, :updated_at]},
      :user => {:only => [:username]}
    },
      :except => [:updated_at])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(recipe_params)
  end

  def destroy
    recipe = Recipe.find_by(id: params[:id])
    recipe.destroy
  end
  
  private

  def recipe_params
    params.require(:recipe).permit(
      :user_id, 
      :name, 
      :volume, 
      :instructions, 
      :notes,
      :og,
      :fg,
      :abv,
      :ibu,
      :srm)
  end

end
