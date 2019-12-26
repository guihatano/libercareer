# frozen_string_literal: true

class Rental < ApplicationRecord
  belongs_to :person
  belongs_to :vehicle

  scope :in_progress, -> { where(return_date: nil) }
  scope :by_vehicle_type, (lambda do |type|
    joins(:vehicle).where('vehicles.vehicle_type = ?', type)
  end)

  validate :person_already_renting?

  def person_already_renting?
    errors.add(:person, 'person_already_renting') if person&.renting?
  end
end
