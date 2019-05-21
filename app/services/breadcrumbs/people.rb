# frozen_string_literal: true

module Breadcrumbs
  class People < Breadcrumbs::Base
    def initialize
      super

      add_breadcrumb_text(I18n.t(:people), admin_people_path)
    end

    def new_action
      add_breadcrumb_text("#{I18n.t(:new_record)}", "#")
    end
  end
end
