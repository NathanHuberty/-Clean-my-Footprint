module CalculationHelper
  def co2_to_euro(km, emission, times, carbon)
      (km * emission * times) / carbon
  end

  def km_total(km, trajet)
    km * trajet
  end
end
