class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = current_user.songs.new
  end

  def create
    binding.pry
    @song = current_user.songs.create(data: params[:song][:audio])
    # @song = current_user.songs.create(content_type: params[:song][:audio].content_type,
    #                                   headers: params[:song][:audio].headers,
    #                                   original_filename: params[:song][:audio].original_filename,
    #                                   tempfile: params[:song][:audio].tempfile)
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
      params.require(:song).permit(:title, audio: [])
    end
end
