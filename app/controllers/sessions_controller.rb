class SessionsController < ApplicationController

  def create
    user = User.update_or_create(request.env["omniauth.auth"])
    session[:id] = user.id
    if user.songs.empty?
      redirect_to new_song_path
    else
      flash[:notice] = "#{t("hello flash")} #{user.first_name}!"
      redirect_to song_path(user.songs.first)
    end
  end

  def destroy
    session.clear
    flash[:notice] = "#{t("signed out flash")}!"
    redirect_to root_url
  end

end
