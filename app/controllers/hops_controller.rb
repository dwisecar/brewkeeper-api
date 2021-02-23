class HopsController < ApplicationController
  skip_before_action :authorized

  def index
    hops = Hop.all
    render json: hops.to_json(:except => [:created_at, :updated_at])
  end

  def show
    hop = Hop.find_by(id: params[:id])
    render json: hop.to_json(:except => [:created_at, :updated_at])
  end

end
