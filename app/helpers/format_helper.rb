module FormatHelper
  def format_trips(trips)
    trips.map do |trip|
      [  [trip.id],
        "<div><p><i class='fa #{trip.transportation.icon}' aria-hidden='true'></i>#{trip.start_address} - #{trip.destination_address}  #{km_total(trip.km, trip.number)}km #{(trip.transportation.emission * km_total(trip.km, trip.number)).round(2)} kg CO2</p></div>".html_safe
      ]
    end
  end
end
