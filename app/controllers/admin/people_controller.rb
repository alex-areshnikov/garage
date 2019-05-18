module Admin
  class PeopleController < Admin::ApplicationController
    def index
      @people = site.people.all
    end

    def show
      person
    end

    def new
      @person = site.people.build
    end

    def edit
      person
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
      params.require(:person).permit(:first_name, :middle_name, :last_name, :birthdate, :person_type, :passport_number,
                                     :passport_issued_by, :passport_issue_date)
    end
  end
end
