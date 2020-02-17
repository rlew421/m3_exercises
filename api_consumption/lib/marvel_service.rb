require 'faraday'
require 'pry'

class MarvelService
  def character(name)
    response = conn.get("characters?apikey=037af0662eeded75ad64e038edfdc735&hash=537bb5672fe49770e74c2b4ee329e517&ts=1581883411&name=#{name}")

    json = JSON.parse(response.body)
  end

  private
  
  def conn
    Faraday.new(url: "http://gateway.marvel.com/v1/public/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
