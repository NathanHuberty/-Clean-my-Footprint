class Project < ApplicationRecord
  has_many :compensations
  has_many :trips, through: :compensations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :carbon, presence: true
  validates :address, presence: true, length: { minimum: 3 }
  has_attachments :photos, maximum: 5
end
