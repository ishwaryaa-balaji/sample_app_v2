class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    @user.save
    if @user.save
      cookies[:user_email] = @user.email
      cookies[:id] = @user.id
      redirect_to products_path
    end
  end
end

