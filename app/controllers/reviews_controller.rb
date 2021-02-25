class ReviewsController < ApplicationController
  skip_before_action :authorized

  def create
    join = {
      recipe_id: params["recipe_id"],
      user_id: params["user_id"],
      content: params["content"]
    }
    review = Review.create(join)
    if review.valid?
      render json: review
    else
      render json: { message: "Review cannot be blank"}, status: :unauthorized
    end
  end

  def destroy

    review = Review.find_by(id: params[:id])
    review.destroy
  end

end
