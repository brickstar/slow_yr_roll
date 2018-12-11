class TranslationsController < ApplicationController
  def update
    if current_user.nil?
      I18n.default_locale = params[:locale]
      redirect_to '/'
    elsif current_user.songs.empty?
      I18n.default_locale = params[:locale]
      redirect_to new_song_path
    else
      I18n.default_locale = params[:locale]
      redirect_back(fallback_location: root_path)
    end
  end
end
