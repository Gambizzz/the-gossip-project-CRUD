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

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      description: params[:description],
      email: params[:email],
      age: params[:age],
      city_id: params[:city_id],
      password: params[:password],
      password_confirmation: params[:password_confirmation])

      if @user.save
        log_in(@user)
        redirect_to basic_pages_home_path
      else
        render "new"
      end
    end
end
