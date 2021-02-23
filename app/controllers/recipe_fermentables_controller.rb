class RecipeFermentablesController < ApplicationController
  skip_before_action :authorized

  def create
    join = {
      recipe_id: params["recipe_id"],
      fermentable_id: params["fermentable_id"]
    }
    RecipeFermentable.create(join)
  end
  
end
