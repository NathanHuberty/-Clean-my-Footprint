require 'open-uri'

class GoogleApi
  def initialize
  end

  # def self.km_calcul(start_address, destination_address, transport)
  def self.km_calcul(trip)
    return trip.distance_from(trip.destination_address).round(2) if trip.transportation.category == "Avion"
    transport = ["Voiture", "Moto"].include?(trip.transportation.category) ? "driving" : "transit"
    url = "https://maps.googleapis.com/maps/api/directions/json?origin=#{trip.start_address.parameterize}&destination=#{trip.destination_address.parameterize}&mode=#{transport}&key=#{ENV['GOOGLE_API_KEY']}"
    trip_serialized = open(url).read
    result = JSON.parse(trip_serialized)
    # result["status"] is "OK" or "ZERO_RESULTS" if no route is found
    if result["status"] == "OK"
      return result['routes'].first['legs'].first['distance']['value'] / 1000
    end
  end
end
