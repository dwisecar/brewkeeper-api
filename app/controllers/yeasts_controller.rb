class YeastsController < ApplicationController
  skip_before_action :authorized

  def index
    yeasts = Yeast.all
    render json: yeasts.to_json(:except => [:created_at, :updated_at])
  end

  def show
    yeast = Yeast.find_by(id: params[:id])
    render json: yeast.to_json(:except => [:created_at, :updated_at])
  end
end
