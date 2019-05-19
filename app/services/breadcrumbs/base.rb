# frozen_string_literal: true

module Breadcrumbs
  class Base
    include Rails.application.routes.url_helpers

    def initialize
      @breadcrumbs = []
      add_breadcrumb_icon(Breadcrumbs::Constants::HOME_ICON, root_path)
    end

    def each
      set_active

      breadcrumbs.each do |breadcrumb|
        yield breadcrumb[:type], breadcrumb[:value], breadcrumb[:path], breadcrumb[:active]
      end
    end

    def add_breadcrumb_text(value, path)
      add_breadcrumb(Breadcrumbs::Constants::TEXT, value, path)
    end

    def add_breadcrumb_icon(value, path)
      add_breadcrumb(Breadcrumbs::Constants::ICON, value, path)
    end

    private

    attr_reader :breadcrumbs

    def add_breadcrumb(type, value, path)
      breadcrumbs.push type: type, value: value, path: path
    end

    def set_active
      breadcrumbs.last[:active] = true
    end
  end
end
