class SongsController < ApplicationController

  def index
    @song = current_user.songs.new
    @songs = Song.all
  end

  def show
  end

  def create
    @song = current_user.songs.create!(song_params)
    if @song.save
      flash[:notice] = "Successfully added new song!"
      redirect_to songs_path
    else
      flash[:alert] = "Error adding new song!"
      render :new
    end
  end

  private

    def song_params
      params.require(:song).permit(:audio)
    end

end
