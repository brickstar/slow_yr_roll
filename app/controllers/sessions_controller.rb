class SessionsController < ApplicationController

  def create
    user = User.update_or_create(request.env["omniauth.auth"])
    session[:id] = user.id
    if user.songs.empty?
      redirect_to new_song_path
    else
      redirect_to songs_path(user.songs.first)
    end
  end

  def destroy
    session.clear
    redirect_to root_url
    flash[:notice] = "Signed out!"
  end

end
