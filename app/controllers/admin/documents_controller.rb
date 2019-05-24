module Admin
  class DocumentsController < Admin::ApplicationController
    def index
      @documents = Document.where(owner: owner).order(:name).all
    end

    def show
      @document = owner.documents.find(params[:id])

      @breadcrumbs = Breadcrumbs::Document.new(@document.owner)
      @breadcrumbs.build(@document)
    end

    def new
      @document = Document.new(owner: owner)

      @breadcrumbs = Breadcrumbs::Document.new(@document.owner)
      @breadcrumbs.new_action
    end

    def edit
      @document = owner.documents.find(params[:id])

      @breadcrumbs = Breadcrumbs::Document.new(@document.owner)
      @breadcrumbs.build(@document)
      @breadcrumbs.edit_action
    end

    def create
      @document = Document.new(document_params.merge(owner: owner))

      if @document.save
        redirect_to public_send("admin_#{@document.owner.class.name.parameterize}_path", @document.owner), notice: t(:was_created, name: @document.name)
      else
        render :new
      end
    end

    def update
      @document = owner.documents.find(params[:id])

      if @document.update(document_params)
        redirect_to public_send("admin_#{@document.owner.class.name.parameterize}_document_path", @document.owner, @document), notice: t(:was_updated, name: @document.name)
      else
        render :edit
      end
    end

    def destroy
      document = owner.documents.find(params[:id])
      document.destroy

      redirect_to public_send("admin_#{document.owner.class.name.parameterize}_path", document.owner), notice: t(:was_destroyed, name: document.name)
    end

    private

    def owner
      site || person
    end

    def site
      Site.find_by(id: params[:site_id])
    end

    def person
      Person.find_by(id: params[:person_id])
    end

    def document_params
      params.require(:document).permit(:name, :description, :file, :document_type, :certificate_number, :issued_by, :issued_date)
    end
  end
end
