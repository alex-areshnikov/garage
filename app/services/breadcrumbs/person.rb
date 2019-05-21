# frozen_string_literal: true

module Breadcrumbs
  class Person < Breadcrumbs::People
    def initialize(person)
      super()

      add_breadcrumb_text(person.full_name, admin_person_path(person))
    end

    def edit_action
      add_breadcrumb_text("#{I18n.t(:edit)}", "#")
    end
  end
end
