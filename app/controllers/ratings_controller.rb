class RatingsController < ApplicationController
  skip_before_action :authorized

  def create
    join = {
      recipe_id: params["recipe_id"],
      user_id: params["user_id"],
      stars: params["value"]
    }
    rating = Rating.create(join)
    render json: rating
  end

  def update
    rating = Rating.find_by(id: params[:id])
    rating.update(
      recipe_id: params["recipe_id"],
      user_id: params["user_id"],
      stars: params["value"]
    )
    render json: rating
  end

end
