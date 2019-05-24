# frozen_string_literal: true

module Breadcrumbs
  class Base
    ALLOWED_TEXT_SIZE = 40

    include Rails.application.routes.url_helpers

    attr_reader :breadcrumbs

    def each
      set_active

      breadcrumbs.each do |breadcrumb|
        yield breadcrumb[:type], breadcrumb[:value], breadcrumb[:path], breadcrumb[:active]
      end
    end

    def add_breadcrumb_text(value, path)
      add_breadcrumb(Breadcrumbs::Constants::TEXT, value.truncate(ALLOWED_TEXT_SIZE), path)
    end

    def add_breadcrumb_icon(value, path)
      add_breadcrumb(Breadcrumbs::Constants::ICON, value, path)
    end

    private

    def add_breadcrumb(type, value, path)
      breadcrumbs.push type: type, value: value, path: path
    end

    def set_active
      breadcrumbs.last[:active] = true
    end
  end
end
