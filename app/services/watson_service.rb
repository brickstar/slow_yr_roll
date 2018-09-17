require 'net/http'
require 'uri'

class WatsonService
  attr_reader :song
  def initialize(song)
    @song = song
  end

  def uri
    URI.parse("https://stream.watsonplatform.net/speech-to-text/api/v1/recognize?inactivity_timeout=60")
  end

  def req
    request = Net::HTTP::Post.new(uri)
    request.basic_auth("14208fd0-7b6f-430c-a051-aab617f4584e", "5Ui56dF1ajTb")
    request.content_type = "audio/mp3"
    request["Transfer-Endoding"] = "chunked"
    request.body = ""
    request.body << File.read("#{song.s3_path}")
  end

  def req_options
    use_ssl: uri.scheme == "https",
  end

  def response
    Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.req(req)
    end
  end

  def lyrics
    JSON.parse(response.body, symbolize_names: true)[:results][2][:alternatives][0][:transcript]
  end
end
