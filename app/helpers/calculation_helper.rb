module CalculationHelper
  def co2_to_euro(km, emission, times, carbon)
      (km * emission * times) / carbon
  end

  def km
    # take distance from google
  end

  def km_total(km, nb_of_trips)
    km * nb_of_trips
  end
end
