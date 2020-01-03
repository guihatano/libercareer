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
        redirect_to admin_people_path
      else
        render :new
      end
    end

    def update
      if @person.update(person_params)
        redirect_to admin_people_path
      else
        render :edit
      end
    end

    private

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