require 'faraday'
require 'pry'

class MarvelService
  def character(name)
    get_json("characters?apikey=037af0662eeded75ad64e038edfdc735&hash=537bb5672fe49770e74c2b4ee329e517&ts=1581883411&name=#{name}")
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body)
  end

  def conn
    Faraday.new(url: "http://gateway.marvel.com/v1/public/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
