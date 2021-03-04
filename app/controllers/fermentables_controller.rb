class FermentablesController < ApplicationController
  skip_before_action :authorized

  def index
    fermentables = Fermentable.all.sort_by{|f|f.name}
    render json: fermentables.to_json(:except => [:created_at, :updated_at])
  end

  def show
    fermentable = Fermentable.find_by(id: params[:id])
    render json: fermentable.to_json(:except => [:created_at, :updated_at])
  end
end
