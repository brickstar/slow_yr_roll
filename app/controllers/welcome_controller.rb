class WelcomeController < ApplicationController
  def index
    @song = current_user.songs.first
  end
end
