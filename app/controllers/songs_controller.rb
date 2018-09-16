class SongsController < ApplicationController

  def new
    @song = current_user.songs.new
  end

  def show
    @song = Song.find(params[:id])
    @new_song = current_user.songs.new
    @songs = Song.all
  end

  def create
    @song = current_user.songs.new(song_params)
    @song.s3_path = Rails.application.routes.url_helpers.rails_blob_path(@song.audio_attachment, only_path: true)
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
