module Admin
  class BaseRatesController < Admin::ApplicationController
    def index
      @base_rates = BaseRate.order(:year).all
    end
  end
end
