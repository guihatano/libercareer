class Rental < ApplicationRecord
  belongs_to :person
  belongs_to :vehicle
end
