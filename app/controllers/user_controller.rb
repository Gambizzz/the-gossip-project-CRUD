class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @city = City.all
  end

  def show
    user_id = params[:id]
    @user = User.find(user_id)
  end

  def create
    @city = City.all
    city = City.find(params[:city])
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      description: params[:description],
      email: params[:email],
      age: params[:age],
      city: city,
      password: params[:password],
      password_confirmation: params[:password_confirmation])

      if @user.save
        redirect_to basic_pages_home_path
      else
        puts @user.errors.full_messages
        render "new"
      end
    end
end
