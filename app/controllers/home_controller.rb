# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @answer_one = Rental.by_vehicle_type(:car).sum(:value)
  end
end
