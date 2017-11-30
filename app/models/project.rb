class Project < ApplicationRecord
  has_many :compensations
  has_many :trips, through: :compensations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :carbon, presence: true
  validates :address, presence: true, length: { minimum: 2 }
  has_attachments :photos, maximum: 5
  # geocoded_by :address
  # after_validation :geocode
end
