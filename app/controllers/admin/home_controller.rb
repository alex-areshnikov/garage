module Admin
  class HomeController < Admin::ApplicationController
    def index
      redirect_to admin_sites_path
    end
  end
end
