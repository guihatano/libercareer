# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :phones, dependent: :destroy
  has_many :rentals
  has_one :license
  validates :name, presence: true

  accepts_nested_attributes_for :phones, allow_destroy: true

  delegate :modalities, to: :license, prefix: true

  scope :by_modality, (lambda do |modality|
    joins(:license).where('licenses.modalities = ?', modality)
  end)

  # rubocop:disable MethodLength
  def can_rent?(vehicle_type = '')
    can_rent = of_age? && !license.expired?
    case vehicle_type
    when 'motorcycle'
      can_rent && license.modalities.include?('a')
    when 'car'
      can_rent && license.modalities.include?('b')
    when 'small_truck'
      can_rent && license.modalities.include?('c')
    when 'truck'
      can_rent && age >= 60 && license.modalities.include?('e')
    when 'bus'
      can_rent && age >= 40 && license.modalities.include?('d')
    else
      can_rent
    end
  end
  # rubocop:enable MethodLength

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

  def total_rentals_value
    rentals.sum(:value)
  end
end
