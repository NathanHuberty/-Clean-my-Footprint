class Compensation < ApplicationRecord
  belongs_to :project
  has_many :trips

end
