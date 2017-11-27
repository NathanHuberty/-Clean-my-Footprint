class Compensation < ApplicationRecord
  belongs_to :project
  has_many :trips
  monetize :amount_cents
end
