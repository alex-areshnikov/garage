module Admin
  class SitesController < Admin::ApplicationController
    before_action :set_site, only: %i[show edit update destroy]

    def index
      @sites = Site.order(:name).all

      @breadcrumbs = Breadcrumbs::Sites.new
    end

    def show
      @breadcrumbs = Breadcrumbs::Site.new(@site)
    end

    def new
      @site = Site.new

      @breadcrumbs = Breadcrumbs::Sites.new
      @breadcrumbs.new_action
    end

    def edit
      @breadcrumbs = Breadcrumbs::Site.new(@site)
      @breadcrumbs.edit_action
    end

    def create
      @site = Site.new(site_params)

      if @site.save
        redirect_to admin_site_path(@site), notice: t(:was_created, name: @site.name)
      else
        render :new
      end
    end

    def update
      if @site.update(site_params)
        redirect_to admin_site_path(@site), notice: t(:was_updated, name: @site.name)
      else
        render :edit
      end
    end

    def destroy
      @site.destroy

      redirect_to admin_sites_path, notice: t(:was_destroyed, name: @site.name)
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:name, :area, :built, :registered, :basement, :cars_count, :electricity, :notes,
                                   :electricity_counter_name, :electricity_counter_expiration_date, :rented,
                                   people_sites_attributes: %i[id person_id site_id relationship _destroy])
    end
  end
end
