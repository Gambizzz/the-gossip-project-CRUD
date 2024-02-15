class SessionsController < ApplicationController
  def new

  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to basic_pages_home_path
    else
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to basic_pages_home_path
  end
end
