# frozen_string_literal: true

class AnswersManager
  def initialize; end

  def process
    build_answers_hash
  end

  private

  def build_answers_hash
    { one: answer_one,
      two: answer_two,
      three: answer_three,
      four: answer_four,
      five: answer_five,
      six: answer_six,
      seven: answer_seven,
      eight: answer_eight,
      nine: answer_nine }
  end

  def answer_one
    Rental.by_vehicle_type(:car).sum(:value)
  end

  def answer_two
    RentalsDelayedsManager.new.process
  end

  def answer_three
    Person.by_modality('E').or(Person.by_modality('A,E'))
  end

  def answer_four
    answer = ''
    Rental.in_progress.each do |rental|
      answer += rental.person.full_name
    end

    answer
  end

  def answer_five
    PersonRentManager.new.process
  end

  def answer_six
    Vehicle.cant_rent_wednesdays
  end

  def answer_seven; end

  def answer_eight; end

  def answer_nine
    License.expiring
  end
end
