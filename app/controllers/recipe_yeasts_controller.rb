class RecipeYeastsController < ApplicationController
  skip_before_action :authorized

  def create
    join = {
      recipe_id: params["recipe_id"],
      yeast_id: params["yeast_id"]
    }
    RecipeYeast.create(join)
  end

end
