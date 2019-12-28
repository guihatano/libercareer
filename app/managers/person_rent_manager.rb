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
      if person.rentals.count >= 2
        can_rent_list << person
      end
    end

    can_rent_list
  end

  private

  def check_no_delay_rentals(rentals)
    count = 0
    rentals.each do |rental|
      count += 1 unless rental.delayed?
    end

    if count >= 2
      true
    else
      false
    end
  end
end