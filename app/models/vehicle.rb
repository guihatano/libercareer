# frozen_string_literal: true

class Vehicle < ApplicationRecord
  enum vehicle_type: %i[car motorcycle truck bus small_truck]
end
