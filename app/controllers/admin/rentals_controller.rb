# frozen_string_literal: true

class Admin
  class RentalsController < Admin::BaseController
    before_action :set_rental, only: %i[edit update show]
    before_action :set_people, :set_vehicles, except: :index

    def index
      @rentals = Rental.all
    end

    def new
      @rental = Rental.new
    end

    def create
      @rental = Rental.create(rental_params)

      if @rental.save
        redirect_to admin_rentals_path
      else
        render :new
      end
    end

    def update
      if @rental.update(rental_params)
        redirect_to admin_rentals_path
      else
        render :edit
      end
    end

    def show
      redirect_to edit_admin_rental_path(@rental)
    end

    def calculate_rental_value
      vehicle = Vehicle.find calculate_params[:vehicle_id]
      end_date = calculate_params[:end_date].to_date
      start_date = calculate_params[:start_date].to_date
      days = (end_date - start_date).to_i
      value = vehicle.daily_rate * days
      render json: { value: value }
    end

    private

    def rental_params
      params.require(:rental).permit(
        :person_id,
        :vehicle_id,
        :value,
        :start_date,
        :end_date,
        :withdrawal_date,
        :return_date
      )
    end

    def calculate_params
      params.require(:rental).permit(
        :vehicle_id,
        :start_date,
        :end_date
      )
    end

    def set_rental
      @rental = Rental.find(params[:id])
    end

    def set_people
      @people = Person.all
    end

    def set_vehicles
      @vehicles = Vehicle.all
    end
  end
end
