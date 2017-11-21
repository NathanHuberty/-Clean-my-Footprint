class Compensation < ApplicationRecord
  belongs_to :project
  has_one :trip
end
