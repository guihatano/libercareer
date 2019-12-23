# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :rentals
  has_one :license
  validates :name, presence: true

  def can_rent?
    of_age? && !license.expired?
  end

  def of_age?
    current = Date.today
    year_difference = current.year - birthdate.year
    return true if year_difference > 21

    year_ok = year_difference == 21
    same_month = current.month == birthdate.month
    month_gone = current.month > birthdate.month
    birthday_gone = current.day >= birthdate.day

    if (year_ok && month_gone) || (year_ok && (same_month && birthday_gone))
      return true
    end

    return false
  end

  def renting?
    rentals.in_progress.present?
  end
end
