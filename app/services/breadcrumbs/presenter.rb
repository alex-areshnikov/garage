# frozen_string_literal: true

module Breadcrumbs
  class Presenter
    CONTROLLER_ACTION_MAPPING = {
      "admin/sites" => {
        "index" => ->(_) { %i[home sites] },
        "show" => ->(_) { %i[home sites site] },
        "edit" => ->(_) { %i[home sites site edit] },
        "new" => ->(_) { %i[home sites new] }
      },
      "admin/people" => {
        "index" => ->(_) { %i[home people] },
        "show" => ->(_) { %i[home people person] },
        "edit" => ->(_) { %i[home people person edit] },
        "new" => ->(_) { %i[home people new] }
      },
      "admin/documents" => {
        "show" => -> (params) { params[:site_id].present? ? %i[home sites site document] : %i[home people person document] },
        "edit" => -> (params) { params[:site_id].present? ? %i[home sites site document edit] : %i[home people person document edit] },
        "new" => -> (params) { params[:site_id].present? ? %i[home sites site new_document] : %i[home people person new_document] }
      },
      "admin/base_rates" => {
        "index" => ->(_) { %i[home base_rates] }
      }
    }.freeze

    BREADCRUMB_BUILDERS = {
      new: ->(_) { { value: I18n.t(:new_record), path: "#" } },
      new_document: ->(_) { { value: "#{I18n.t(:new)} #{I18n.t('activerecord.models.document')}", path: "#" } },
      edit: ->(_) { { value: I18n.t(:edit), path: "#" } },
      home: ->(_) { { type: Breadcrumbs::Constants::ICON, value: "home", path: Breadcrumbs::Pathes.new.root_path } },
      sites: ->(_) { { value: I18n.t(:sites), path: Breadcrumbs::Pathes.new.admin_sites_path } },
      people: ->(_) { { value: I18n.t(:people), path: Breadcrumbs::Pathes.new.admin_people_path } },
      base_rates: ->(_) { { value: I18n.t('activerecord.models.base_rate'), path: Breadcrumbs::Pathes.new.admin_base_rates_path } },

      site: lambda do |params|
        site = ::Site.find(params[:site_id] || params[:id])
        { value: site.name, path: Breadcrumbs::Pathes.new.admin_site_path(site) }
      end,

      person: lambda do |params|
        person = ::Person.find(params[:person_id] || params[:id])
        { value: person.full_name, path: Breadcrumbs::Pathes.new.admin_person_path(person) }
      end,

      document: lambda do |params|
        document = ::Document.find(params[:id])

        { value: document.name,
          path: Breadcrumbs::Pathes.new.public_send("admin_#{document.owner.class.name.parameterize}_document_path", document.owner, document) }
      end
    }.freeze

    delegate :present?, to: :breadcrumbs

    def initialize(params)
      @params = params
      @breadcrumbs = []
    end

    def build
      breadcrumbs = Breadcrumbs::Presenter::CONTROLLER_ACTION_MAPPING
                    .fetch(params[:controller], {})
                    .fetch(params[:action], ->(_) {}).call(params)

      return if breadcrumbs.blank?

      @breadcrumbs = breadcrumbs.map do |breadcrumb|
        Breadcrumbs::Presenter::BREADCRUMB_BUILDERS.fetch(breadcrumb).call(params)
      end
    end

    def each
      set_active

      breadcrumbs.each do |breadcrumb|
        yield breadcrumb.fetch(:type, Breadcrumbs::Constants::TEXT),
          breadcrumb[:value].truncate(Breadcrumbs::Constants::ALLOWED_TEXT_SIZE),
          breadcrumb[:path],
          breadcrumb[:active]
      end
    end

    private

    attr_reader :params, :breadcrumbs

    def set_active
      breadcrumbs.last[:active] = true
    end
  end
end
