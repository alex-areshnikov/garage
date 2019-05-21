module Admin
  class PeopleController < Admin::ApplicationController
    def index
      @people = Person.order(:last_name, :first_name).all

      @breadcrumbs = Breadcrumbs::People.new
    end

    def show
      @breadcrumbs = Breadcrumbs::Person.new(person)
    end

    def new
      @person = Person.new

      @breadcrumbs = Breadcrumbs::People.new
      @breadcrumbs.new_action
    end

    def edit
      @breadcrumbs = Breadcrumbs::Person.new(person)
      @breadcrumbs.edit_action
    end

    def create
      @person = Person.new(person_params)

      if @person.save
        redirect_to admin_person_path(@person), notice: t(:was_created, name: @person.full_name)
      else
        render :new
      end
    end

    def update
      if person.update(person_params)
        redirect_to admin_person_path(@person), notice: t(:was_updated, name: @person.full_name)
      else
        render :edit
      end
    end

    def destroy
      person.destroy

      redirect_to admin_people_path, notice: t(:was_destroyed, name: person.full_name)
    end

    private

    def person
      @person ||= Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:first_name, :middle_name, :last_name, :birthdate,
                                     :passport_number, :passport_issued_by, :passport_issue_date,
                                     phones_attributes: %i[id number description _destroy])
    end
  end
end
