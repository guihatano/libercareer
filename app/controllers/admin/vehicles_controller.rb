# frozen_string_literal: true

class Admin
  class VehiclesController < Admin::BaseController
    before_action :set_vehicle, only: %i[edit update show]

    def index
      @vehicles = Vehicle.all.paginate(page: params[:page] || 1, per_page: 10)
    end

    def new
      @vehicle = Vehicle.new
    end

    def create
      @vehicle = Vehicle.create(vehicle_params)

      if @vehicle.save
        redirect_to admin_vehicles_path, notice: 'Adicionado com sucesso!'
      else
        render :new
      end
    end

    def update
      if @vehicle.update(vehicle_params)
        redirect_to admin_vehicles_path, notice: 'Salvo com sucesso!'
      else
        render :edit
      end
    end

    def destroy
      @vehicle = Vehicle.find(params[:id])
      @vehicle.destroy
      redirect_to admin_vehicles_path, notice: 'Removido com sucesso!'
    rescue ActiveRecord::RecordNotFound
      redirect_to admin_vehicles_path, alert: 'Registro já foi removido'
    rescue ActiveRecord::RecordNotDestroyed
      redirect_to admin_vehicles_path, alert: 'Não foi possível remover'
    end

    private

    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
      params.require(:vehicle).permit(
        :model,
        :year,
        :license_plate,
        :color,
        :vehicle_type
      )
    end
  end
end