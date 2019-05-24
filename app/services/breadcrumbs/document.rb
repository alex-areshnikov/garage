# frozen_string_literal: true

module Breadcrumbs
  class Document < Breadcrumbs::Base
    OWNER_BREADCRUMBS_MAP = {
      'Site' => Breadcrumbs::Site,
      'Person' => Breadcrumbs::Person
    }.freeze

    def initialize(owner)
      breadcrumbs_klass = OWNER_BREADCRUMBS_MAP.fetch(owner.class.name)
      @breadcrumbs = breadcrumbs_klass.new(owner).breadcrumbs
    end

    def build(document)
      path = public_send("admin_#{document.owner.class.name.parameterize}_document_path", document.owner, document)
      add_breadcrumb_text(document.name, path)
    end

    def new_action
      add_breadcrumb_text("#{I18n.t(:new)} #{I18n.t('activerecord.models.document')}", "#")
    end

    def edit_action
      add_breadcrumb_text("#{I18n.t(:edit)}", "#")
    end
  end
end
