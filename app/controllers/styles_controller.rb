class StylesController < ApplicationController
  skip_before_action :authorized

  def index
    styles = Style.all.sort
    render json: styles.to_json(:except => [:created_at, :updated_at])
  end

  def show
    style = Style.find_by(id: params[:id])
    render json: style.to_json(:except => [:created_at, :updated_at])
  end

end
