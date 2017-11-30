class Trip < ApplicationRecord
  attr_accessor :num_return, :recurring, :occasional, :number_per, :time_unit, :date_since, :number_of_times, :frequency

  belongs_to :user
  belongs_to :transportation
  belongs_to :compensation, optional: true
  validates :transportation_id, presence: true
  validates :km, presence: true, numericality: { greater_than: 0 }
  validates :number, numericality: { greater_than: 0 }
  validates :start_address, presence: true
  validates :destination_address, presence: true
  geocoded_by :start_address
  after_validation :geocode
  scope :pending, -> { where(compensation_id: nil) }
  scope :clean, -> { where.not(compensation_id: nil) }

  def self.carbon_quantity
    all.inject(0){ |sum, trip| sum + (trip.number * trip.km * trip.transportation.emission) }
  end

  def self.levels
    [
      {
        image: "levels/level-0.png",
        content: "Baby cleaner",
        value: 0
      },
      {
        image: "levels/level-1.png",
        content: "Cleaner ado",
        value: 100
      },
      {
        image: "levels/level-2.png",
        content: "Cleaner adulte",
        value: 1000
      },
      {
        image: "levels/level-3.png",
        content: "Cleaner écolo",
        value: 5000
      },
      {
        image: "levels/level-4.png",
        content: "Super cleaner",
        value: 10000000
      }
    ]
  end

  def self.level_index
    level_values = levels.map{ |level| level[:value]}
    (level_values + [carbon_quantity]).sort.index(carbon_quantity) - 1
  end

  def self.relative_score
    i = level_index
    if i != levels[i][:value].size - 1
      (carbon_quantity - levels[i][:value]) / (levels[i + 1][:value] - levels[i][:value])
    else
      1
    end
  end


end
