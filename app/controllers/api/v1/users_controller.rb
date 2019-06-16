class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: %i[:update destroy]


  def index
    @users = User.order(name: :DESC)
    render json: @users
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def destroy
    @user.delete
  end


  def update
  @user.update(params.permit(:name))
  end

  private

  def user_params
    params.permit(:name)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
