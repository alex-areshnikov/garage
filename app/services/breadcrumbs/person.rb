# frozen_string_literal: true

module Breadcrumbs
  class Person < Breadcrumbs::People
    def initialize(person)
      super(person.site)

      add_breadcrumb_text(person.full_name, admin_site_person_path(person.site, person))
    end

    def edit_action
      add_breadcrumb_text("#{I18n.t(:edit)}", "#")
    end
  end
end
