# frozen_string_literal: true

class Admin
  class PeopleController < Admin::BaseController
    before_action :set_person, only: %i[edit update show]

    def index
      @people = Person.all.paginate(page: params[:page] || 1, per_page: 10)
    end

    def new
      @person = Person.new
    end

    def create
      @person = Person.create(person_params)

      if @person.save
        redirect_to admin_people_path, notice: "Criado com sucesso!"
      else
        render :new
      end
    end

    def update
      if @person.update(person_params)
        redirect_to admin_people_path, notice: "Salvo com sucesso!"
      else
        render :edit
      end
    end

    def destroy
      begin
        @person = Person.find(params[:id])
        @person.destroy
        redirect_to admin_people_path, notice: "Removido com sucesso!"
      rescue ActiveRecord::RecordNotFound
        redirect_to admin_people_path, alert: 'Registro já foi removido'
      rescue ActiveRecord::RecordNotDestroyed
        redirect_to admin_people_path, alert: 'Não foi possível remover'
      end
    end

    private

    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(
        :name,
        :surname,
        :document,
        :email,
        :birthdate,
        phones_attributes: %i[code phone_type preferential]
      )
    end
  end
end