require 'open-uri'

class GoogleApi
  def initialize
  end

  def self.km_calcul(start_address, destination_address, transport)
    url = "https://maps.googleapis.com/maps/api/directions/json?origin=#{start_address.parameterize}&destination=#{destination_address.parameterize}&mode=#{transport}&key=#{ENV['GOOGLE_API_KEY']}"
    trip_serialized = open(url).read
    trip = JSON.parse(trip_serialized)
    # trip["status"] == "OK" or "ZERO_RESULTS"
    if trip["status"] == "OK"
      return trip['routes'].first['legs'].first['distance']['value'] / 1000
    else
      # flash?
    end
  end
end
