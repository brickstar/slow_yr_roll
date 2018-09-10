class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = current_user.songs.new
  end

  def create
    @song = current_user.songs.create!(song_params)
    if @song.save
      flash[:notice] = "Successfully added new song!"
      redirect_to root_path
    else
      flash[:alert] = "Error adding new song!"
      render :new
    end
  end

  def stream
    song = Song.find(params[:id])
    if song
      send_file song.tempfile
    end
    render :index
  end

  private

    def song_params
      params.require(:song).permit(:audio)
    end
end
