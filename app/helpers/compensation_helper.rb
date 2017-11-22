module CompensationHelper
  def compensated?(trip)
    trip.compensation.nil? ? false : true
  end
end
