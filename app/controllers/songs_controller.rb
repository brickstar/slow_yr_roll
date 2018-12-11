class SongsController < ApplicationController

  def new
    @song = current_user.songs.new
  end

  def show
    @song = current_user.songs.find(params[:id])
    @new_song = current_user.songs.new
    @songs = current_user.songs.all
  end

  def create
    @song = current_user.songs.new(song_params)
    @song.s3_path = Rails.application.routes.url_helpers.rails_blob_path(@song.audio_attachment, only_path: true)
    if @song.save
      flash[:notice] = "#{t("success flash")}!"
      redirect_to song_path(@song)
    elsif current_user.songs.length == 1 && current_user.songs.first.title.empty?
      flash[:alert] = "#{t("error adding flash")}"
      render :new
    else
      flash[:alert] = "#{t("error adding flash")}"
      redirect_to song_path(current_user.songs.first)
    end
  end

  def destroy
    @song = current_user.songs.find(params[:id])
    @song.destroy
    flash[:success] = "#{@song.title} #{t("successfully deleted flash")}!"
    if current_user.songs.empty?
      render :new
    else
      redirect_to song_path(current_user.songs.first)
    end
  end

  private

    def song_params
      params.require(:song).permit(:audio, :title)
    end

end
