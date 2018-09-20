class GetLyricsJob < ApplicationJob
  queue_as :default

  def perform(params)
    service = WatsonService.new(params)
    service.lyrics
  end
end
