class InstaFetcher

  def initialize
    @insta_connection = Faraday.new(url: 'https://api.instagram.com') do |faraday|
      faraday.request   :url_encoded
      faraday.response  :logger
      faraday.adapter   Faraday.default_adapter
    end
  end

  def park_pics(lat, lng, token)
    response = @insta_connection.get do |req|
      req.url "/v1/media/search"
      req.params['lat'] = lat
      req.params['lng'] = lng
      req.params['access_token'] = token
    end
    JSON.parse(response.body)
  end

end
