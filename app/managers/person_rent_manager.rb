# frozen_string_literal: true

class PersonRentManager
  def initialize
    @people = Person.all
  end

  def process
    can_rent_more_days
  end

  def can_rent_more_days
    can_rent_list = []
    @people.each do |person|
      can_rent_list << person if person.rentals.count >= 2
    end

    can_rent_list
  end

  private

  def check_no_delay_rentals(rentals)
    count = 0
    rentals.each do |rental|
      count += 1 unless rental.delayed?
    end

    count >= 2
  end
end
