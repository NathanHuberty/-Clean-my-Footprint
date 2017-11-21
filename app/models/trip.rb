class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :transportation
  belongs_to :compensation, optional: true
  validates :km, presence: true
  validates :number, numericality: { greater_than: 0 }
  # validates :start_address, length: { minimum: 1 }
  # validates :destination_address, length: { minimum: 1 }
end
