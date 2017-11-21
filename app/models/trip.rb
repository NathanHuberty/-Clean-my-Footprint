class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :transportation
  belongs_to :compensation
end
