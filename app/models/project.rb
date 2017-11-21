class Project < ApplicationRecord
  has_many :compensations
  has_many :trips, through: :compensations
end
