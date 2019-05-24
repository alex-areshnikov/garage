class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit, :set_breadcrumbs

  def set_breadcrumbs
    @breadcrumbs = Breadcrumbs::Presenter.new(params.permit!).tap(&:build)
  end
end
