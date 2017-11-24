class Trip < ApplicationRecord
  attr_accessor :num_return, :recurrent, :number_per, :time_unit, :date_since, :number_of_times
  belongs_to :user
  belongs_to :transportation
  belongs_to :compensation, optional: true
  validates :km, presence: true, numericality: { greater_than: 0 }
  validates :number, numericality: { greater_than: 0 }
  # validates :start_address, length: { minimum: 1 }
  # validates :destination_address, length: { minimum: 1 }
end
