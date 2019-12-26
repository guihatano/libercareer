# frozen_string_literal: true

class Vehicle < ApplicationRecord
  enum vehicle_type: {
    car: 'car',
    motorcycle: 'motorcycle',
    truck: 'truck',
    bus: 'bus',
    small_truck: 'small_truck'
  }
end
