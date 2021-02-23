class RecipeStylesController < ApplicationController
  skip_before_action :authorized

  def create
    join = {
      recipe_id: params["recipe_id"],
      style_id: params["style_id"]
    }
    RecipeStyle.create(join)
  end

end
