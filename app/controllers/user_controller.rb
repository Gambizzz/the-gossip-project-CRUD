class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    user_id = params[:id]
    @user = User.find(user_id)
  end
end
