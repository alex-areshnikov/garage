# frozen_string_literal: true

module Breadcrumbs
  class Home < Breadcrumbs::Base
    def initialize
      @breadcrumbs = []
      add_breadcrumb_icon(Breadcrumbs::Constants::HOME_ICON, root_path)
    end
  end
end
