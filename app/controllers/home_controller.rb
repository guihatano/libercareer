# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @answer_one = Rental.by_vehicle_type(:car).sum(:value)
    @answer_two = RentalsDelayedsManager.new.process
    @answer_three = Person.by_modality('E').or(Person.by_modality('A,E'))
    @answer_four = ''
    Rental.in_progress.each do |rental|
      @answer_four += rental.person.full_name
    end
    @answer_five = PersonRentManager.new.process
    @answer_six = ''
    @answer_seven = ''
    @answer_eight = ''
    @answer_nine = ''
  end
end
