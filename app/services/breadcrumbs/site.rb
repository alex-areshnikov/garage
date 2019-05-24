# frozen_string_literal: true

module Breadcrumbs
  class Site < Breadcrumbs::Base
    def initialize(site)
      @breadcrumbs = Breadcrumbs::Sites.new.breadcrumbs

      add_breadcrumb_text(site.name, admin_site_path(site))
    end

    def edit_action
      add_breadcrumb_text(I18n.t(:edit), "#")
    end
  end
end
