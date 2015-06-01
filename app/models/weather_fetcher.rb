class WeatherFetcher
  def initialize
    @wu_connection = Faraday.new(url: 'http://api.wunderground.com')  do |faraday|
      faraday.request   :url_encoded
      faraday.response  :logger
      faraday.adapter   Faraday.default_adapter
    end
  end

  def park_weather(lat,lon)
    response = @wu_connection.get do |req|
      req.url "/api/#{ENV['WEATHER_UNDERGROUND_KEY']}/forecast10day/q/#{lat},#{lon}.json"
      req.headers['Content-Type'] = 'application/json'
    end
    JSON.parse(response.body)
  end

end
