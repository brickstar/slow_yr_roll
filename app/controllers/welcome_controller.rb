class WelcomeController < ApplicationController
  def index
    @song = current_user.songs.first if current_user
  end
end
