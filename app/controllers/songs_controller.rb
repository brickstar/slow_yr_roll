class SongsController < ApplicationController

  def index
    @song = current_user.songs.new
    @songs = Song.all
  end

  def new
    @song = current_user.songs.new
  end

  def show
    @new_song = current_user.songs.new
    @song = Song.find(params[:id])
    @songs = Song.all
  end

  def create
    @song = current_user.songs.create!(song_params)
    if @song.save
      flash[:notice] = "Successfully added new song!"
      redirect_to song_path(@song)
    else
      flash[:alert] = "Error adding new song!"
      render :new
    end
  end

  private

    def song_params
      params.require(:song).permit(:audio, :title)
    end

end
