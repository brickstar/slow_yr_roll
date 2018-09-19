class GetLyricsJob < ApplicationJob
  queue_as :default

  def perform(params)
    service = WatsonService.new(params[:song][:audio].tempfile)
    service.lyrics
    # Do something later
  end
end
