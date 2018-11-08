require 'net/http'
require 'uri'

class WatsonSpeechService
  attr_reader :song

  def initialize(song = nil)
    @song = song
  end

  def lyrics
    get_json[:results].map { |json| json[:alternatives][0][:transcript] }.join(',').gsub(',','')
  end

  private

    def get_json
      json = JSON.parse(response.body, symbolize_names: true)
    end

    def req
      request = Net::HTTP::Post.new(uri)
      request.basic_auth("#{ENV["WATSON_USERNAME"]}", "#{ENV["WATSON_PASSWORD"]}")
      request.content_type = "audio/mp3"
      request["Transfer-Endoding"] = "chunked"
      request.body = File.read(song)
      request
    end

    def response
      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(req)
      end
    end

    def uri
      URI.parse("https://stream.watsonplatform.net/speech-to-text/api/v1/recognize?inactivity_timeout=60")
    end

    def req_options
      {
        use_ssl: uri.scheme == "https",
      }
    end
end
