class ReviewsController < ApplicationController
  skip_before_action :authorized

  def create
    review = Review.create(review_params)
    if review.valid?
      render json: review.to_json(:include => {
        :user => {:only => [:id, :username]}})
    else
      render json: { message: "Review cannot be blank"}, status: :unauthorized
    end
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    if review.valid?
      render json: review.to_json(:include => {
        :user => {:only => [:id, :username]}})
    else
      render json: { message: "Review cannot be blank"}, status: :unauthorized
    end
  end

  def destroy

    review = Review.find_by(id: params[:id])
    review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :recipe_id, :content)
  end

end
