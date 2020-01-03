# frozen_string_literal: true

class License < ApplicationRecord
  belongs_to :person

  enum modalities: {
    a: 'A',
    b: 'B',
    c: 'C',
    d: 'D',
    e: 'E',
    ab: 'A,B',
    ac: 'A,C',
    ad: 'A,D',
    ae: 'A,E',
    special: 'special'
  }

  scope :expiring, -> { where('expiration_date <= ?', (Date.today + 1.month)) }
  scope :expireds, -> { where('expiration_date < ?', Date.today) }
  scope :by_modality, ->(modality) { where(modalities: modality) }

  def expired?
    expiration_date < Date.today
  end

  def to_drive_car?
    modalities.include?('b') || modalities.include?('c') ||
      modalities.include?('d') || modalities.include?('e')
  end

  def to_drive_motorcycle?
    modalities.include?('a')
  end

  def to_drive_small_truck?
    modalities.include?('c') ||
      modalities.include?('d') ||
      modalities.include?('e')
  end

  def to_drive_bus?
    modalities.include?('d') || modalities.include?('e')
  end

  def to_drive_truck?
    modalities.include?('e')
  end
end
