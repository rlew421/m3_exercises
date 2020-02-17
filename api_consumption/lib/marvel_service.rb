require 'digest'
require 'faraday'
require 'pry'

class MarvelService
  def character(name)
    get_json("characters?apikey=037af0662eeded75ad64e038edfdc735&hash=#{hash_digest}&ts=#{timestamp}&name=#{name}")
  end

  # def creators(first_name: first_name)
  #   get_json("creators?apikey=037af0662eeded75ad64e038edfdc735&hash=#{hash_digest}&ts=#{timestamp}&firstName=#{first_name}")
  # end

  def creators(last_name: last_name)
    get_json("creators?apikey=037af0662eeded75ad64e038edfdc735&hash=#{hash_digest}&ts=#{timestamp}&lastName=#{last_name}")
  end

  private

  def timestamp
    Time.now.to_i
  end

  def hash_digest
    private_key = "1914f30557567f3b202b98d61bf1182d5903c17c"

    public_key = "037af0662eeded75ad64e038edfdc735"

    Digest::MD5.hexdigest "#{timestamp}#{private_key}#{public_key}"
  end

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
