# frozen_string_literal: true

class RentalsDelayedsManager
  def initialize
    @rentals = Rental.delayeds
  end

  def process
    rentals_hash_array = []

    @rentals.each do |rental|
      rentals_hash_array << build_person_hash(rental)
    end

    rentals_hash_array
  end

  private

  def build_person_hash(rental)
    days, hours, minutes = get_time_diff(rental.end_date)
    {
      name: rental.person.full_name,
      days: days,
      hours: hours,
      minutes: minutes
    }
  end

  def get_time_diff(expired_date)
    seconds = Time.now - expired_date
    minutes, _sec = seconds.divmod(60)
    hours, minutes = minutes.divmod(60)
    days, hours = hours.divmod(24)
    puts "#{days} days, #{hours} hours and #{minutes} minutes"

    [days, hours, minutes]
  end
end
