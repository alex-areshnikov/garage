module Admin
  class PeopleController < Admin::ApplicationController
    def index
      @people = site.people.order(:person_type, :id).all

      @breadcrumbs = Breadcrumbs::People.new(site)
    end

    def show
      @breadcrumbs = Breadcrumbs::Person.new(person)
    end

    def new
      @person = site.people.build

      @breadcrumbs = Breadcrumbs::People.new(site)
      @breadcrumbs.new_action
    end

    def edit
      @breadcrumbs = Breadcrumbs::Person.new(person)
      @breadcrumbs.edit_action
    end

    def create
      @person = site.people.new(person_params)

      if @person.save
        redirect_to admin_site_person_path(site, @person), notice: t(:was_created, name: @person.full_name)
      else
        render :new
      end
    end

    def update
      if person.update(person_params)
        redirect_to admin_site_person_path(site, @person), notice: t(:was_updated, name: @person.full_name)
      else
        render :edit
      end
    end

    def destroy
      person.destroy

      redirect_to admin_site_people_path(site), notice: t(:was_destroyed, name: person.full_name)
    end

    private

    def person
      @person ||= site.people.find(params[:id])
    end

    def site
      @site ||= Site.find(params[:site_id])
    end

    def person_params
      params.require(:person).permit(:first_name, :middle_name, :last_name, :birthdate, :person_type,
                                     :passport_number, :passport_issued_by, :passport_issue_date,
                                     phones_attributes: %i[id number description _destroy])
    end
  end
end
