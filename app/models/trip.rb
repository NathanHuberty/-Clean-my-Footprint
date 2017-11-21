class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :transportation
  belongs_to :compensation
  validates :km, presence: true
  validates :number, numericality: { greater_than: 0 }
  # validates :start_address, REGEX
  # validates :destination_address, REGEX
end
