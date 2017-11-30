module CalculationHelper
  def co2_to_euro(km, emission, times, carbon)
    (km * emission * times) / carbon
  end

  def km_total(km, nb_of_trips)
      km * nb_of_trips
  end

  def total_project_amount(project)
    amount = 0
    project.compensations.each do |compensation|
      amount += compensation.amount_cents.to_f / 100
    end
    amount.round(2)
  end
end
