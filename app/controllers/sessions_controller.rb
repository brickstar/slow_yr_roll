class SessionsController < ApplicationController

  def create
    user = User.update_or_create(env["omniauth.auth"])
    session[:id] = user.id
    redirect_to root_path  
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

end
