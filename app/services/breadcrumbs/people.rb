# frozen_string_literal: true

module Breadcrumbs
  class People < Breadcrumbs::Site
    def initialize(site)
      super

      add_breadcrumb_text("#{I18n.t(:owners)}/#{I18n.t(:renters)}", admin_site_people_path(site))
    end

    def new_action
      add_breadcrumb_text("#{I18n.t(:new_record)}", "#")
    end
  end
end
