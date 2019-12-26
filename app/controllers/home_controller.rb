# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @answer_one = Rental.by_vehicle_type(:car).sum(:value)

    @answer_two = ''
    @answer_three = ''
    @answer_four = ''
    Rental.in_progress.each do |rental|
      @answer_four += rental.person.full_name
    end
    @answer_five = ''
    @answer_six = ''
    @answer_seven = ''
    @answer_eight = ''
    @answer_nine = ''
  end
end
