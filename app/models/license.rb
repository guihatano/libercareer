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

  scope :expiring, -> { where('expiration_date <= ?', (Date.today+1.month)) }
  scope :expireds, -> { where('expiration_date < ?', Date.today) }

  def expired?
    expiration_date < Date.today
  end
end
