
module CalculationHelper
  def co2_to_euro(km, emission, times, carbon)
      (km * emission * times) / carbon
  end
end
