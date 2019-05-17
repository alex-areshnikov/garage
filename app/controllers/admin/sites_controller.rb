module Admin
  class SitesController < Admin::ApplicationController
    before_action :set_site, only: [:show, :edit, :update, :destroy]

    def index
      @sites = Site.all
    end

    def show; end

    def new
      @site = Site.new
    end

    def edit; end

    def create
      @site = Site.new(site_params)

      if @site.save
        redirect_to admin_site_path(@site), notice: 'Site was successfully created.'
      else
        render :new
      end
    end

    def update
      if @site.update(site_params)
        redirect_to admin_site_path(@site), notice: 'Site was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @site.destroy
      respond_to do |format|
        format.html {redirect_to sites_url, notice: 'Site was successfully destroyed.'}
        format.json {head :no_content}
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:name, :area, :built, :regestered, :basement, :cars_count, :electricity, :electricity_counter_name, :electricity_counter_expiration_date, :rented)
    end
  end
end
