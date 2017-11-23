class Transportation < ApplicationRecord
  TRANSPORTS = ["Voiture", "Train", "Avion", "Transport en commun", "Moto"]
  has_many :trips
  validates :category, presence: true, uniqueness: true, inclusion: { in: TRANSPORTS }
  validates :emission, presence: true

  def name
    category
  end
end
