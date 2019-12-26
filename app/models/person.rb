# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :rentals
  has_one :license
  validates :name, presence: true

  def can_rent?
    of_age? && !license.expired?
  end

  def of_age?
    return true if Date.today.year - birthdate.year > 21

    if Date.today.year - birthdate.year == 21 &&
       check_month_and_day
      return true
    end

    false
  end

  def check_month_and_day
    if Date.today.month > birthdate.month ||
       (Date.today.month == birthdate.month &&
       Date.today.day >= birthdate.day)
      return true
    end

    false
  end

  def renting?
    rentals.in_progress.present?
  end

  def age
    ((Time.zone.now - birthdate.to_time) / 1.year.seconds).floor
  end

  def full_name
    "#{name} #{surname}".squish
  end
end
