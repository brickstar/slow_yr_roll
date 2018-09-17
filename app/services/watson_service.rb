require 'net/http'
require 'uri'

class WatsonService
  attr_reader :song
  def initialize(song = nil)
    @song = song
  end

  #
  # def req
  #   request = Net::HTTP::Post.new(uri)
  #   request.basic_auth("14208fd0-7b6f-430c-a051-aab617f4584e", "5Ui56dF1ajTb")
  #   request.content_type = "audio/mp3"
  #   request["Transfer-Endoding"] = "chunked"
  #   request.body = ""
  #   request.body << File.read("/Users/brickstar/Downloads/lisa_abc.mp3")
  # end
  #
  #
  # def response
  #   Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  #     http.req(req)
  #   end
  # end

  def lyrics
    JSON.parse(response.body, symbolize_names: true)[:results][0][:alternatives][0][:transcript]
  end

  private

    def uri
      URI.parse("https://stream.watsonplatform.net/speech-to-text/api/v1/recognize?inactivity_timeout=60")
    end

    def req_options
      {
        use_ssl: uri.scheme == "https",
      }
    end

    def response
      # uri = URI.parse("https://stream.watsonplatform.net/speech-to-text/api/v1/recognize?inactivity_timeout=60")

      request = Net::HTTP::Post.new(uri)

      request.basic_auth("#{ENV["WATSON_USERNAME"]}", "#{ENV["WATSON_PASSWORD"]}")

      request.content_type = "audio/mp3"

      request["Transfer-Encoding"] = "chunked"

      request.body = ""

      request.body << File.read("/Users/brickstar/Downloads/lisa_abc.mp3")

      # req_options = {
      #   use_ssl: uri.scheme == "https",
      # }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
    end
end
