class RecFetcher
  def initialize
    @rec_connection = Faraday.new(url: 'https://ridb.recreation.gov') do |faraday|
      faraday.request   :url_encoded
      faraday.response  :logger
      faraday.adapter   Faraday.default_adapter
    end
  end

  def park_info(rec_id)
    response = @rec_connection.get do |req|
      req.url "/api/v1/recareas/#{rec_id}/"
      req.params['apikey'] = ENV['RECREATION_GOV_KEY']
    end
    JSON.parse(response.body)
  end

  def park_photos(rec_id)
    response = @rec_connection.get do |req|
      req.url "/api/v1/recareas/#{rec_id}/media/"
      req.params['apikey'] = ENV['RECREATION_GOV_KEY']
    end
    JSON.parse(response.body)
  end

  def park_links(rec_id)
    response = @rec_connection.get do |req|
      req.url "/api/v1/recareas/#{rec_id}/links/"
      req.params['apikey'] = ENV['RECREATION_GOV_KEY']
    end
    JSON.parse(response.body)
  end

end
