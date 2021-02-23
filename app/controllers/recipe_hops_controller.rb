class RecipeHopsController < ApplicationController
  skip_before_action :authorized

  def create
    join = {
      recipe_id: params["recipe_id"],
      hop_id: params["hop_id"]
    }
    RecipeHop.create(join)
  end

end
