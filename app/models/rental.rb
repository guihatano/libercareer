# frozen_string_literal: true

class Rental < ApplicationRecord
  belongs_to :person
  belongs_to :vehicle

  scope :in_progress, -> { where(return_date: nil) }
  scope :by_vehicle_type, (lambda do |type|
    joins(:vehicle).where('vehicles.vehicle_type = ?', type)
  end)
  scope :delayeds, -> { where('end_date < ?', Time.now).in_progress }

  validates_presence_of :person, :vehicle, :start_date, :end_date
  validate :person_already_renting?
  validate :start_and_end_date

  def person_already_renting?
    if person&.renting? &&
       person.rentals.in_progress.first == self
      errors.add(:person_id, :person_already_renting)
    end
  end

  def start_and_end_date
    return false if end_date.nil? || start_date.nil?

    if end_date < start_date
      errors.add(:end_date, :end_date_less_than_start_date)
    else
      true
    end
  end

  def delayed?
    (end_date < Time.now) && return_date.nil?
  end
end
