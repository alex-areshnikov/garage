# frozen_string_literal: true

module Breadcrumbs
  class Sites < Breadcrumbs::Base
    def initialize
      @breadcrumbs = Breadcrumbs::Home.new.breadcrumbs

      add_breadcrumb_text(I18n.t(:sites), admin_sites_path)
    end

    def new_action
      add_breadcrumb_text("#{I18n.t(:new)} #{I18n.t('activerecord.models.site')}", "#")
    end
  end
end
