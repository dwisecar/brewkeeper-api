class Api::V1::UsersController < ApplicationController
  
  skip_before_action :authorized, only: [:create, :index, :show]
  
  def index
    users = User.all
    render json: users.to_json(:include => {
      :recipes => {:only => [:id]}},
      :except => [:password_digest, :updated_at]
    )
  end
  
  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.create(user_params)
    if user.valid?
      token = encode_token({ user_id: user.id })
      render json: { user: UserSerializer.new(user), jwt: token }, status: :created
    else    
      render json: { error: user.errors.full_messages }, status: :not_acceptable
    end
  end

  def update 
    user = User.find_by(id: params[:id])
    user.update(user_params)
    if user.valid?
      render json: { user: UserSerializer.new(user), jwt: params[:token]}
    else
      render json: { error: user.errors.full_messages }, status: :not_acceptable
    end
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end
 
  private

  def user_params
    params.permit(:username, :password, :bio, :avatar)
  end
end 