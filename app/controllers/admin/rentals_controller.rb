# frozen_string_literal: true

class Admin
  class RentalsController < Admin::BaseController
    def index
      @rentals = Rental.all
    end
  end
end
