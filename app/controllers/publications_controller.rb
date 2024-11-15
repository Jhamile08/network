class PublicationsController < ApplicationController
  before_action :set_publication, only: %i[show edit update destroy]

  # GET /publications
  def index
    @publications = if params[:category].present?
                      Publication.where(category_id: params[:category])
                    else
                      Publication.all
                    end
  end

  # GET /publications/1
  def show
  end

  # GET /publications/new
  def new
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  def create
    @publication = current_user.publications.build(publication_params)

    if @publication.save
      redirect_to @publication, notice: 'Publication was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /publications/1
  def update
    if @publication.update(publication_params)
      redirect_to @publication, notice: 'Publication was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /publications/1
  def destroy
    @publication.destroy!
    redirect_to publications_url, notice: 'Publication was successfully destroyed.', status: :see_other
  end

  def toggle_active
    @publication = Publication.find(params[:id])
    @publication.update(active: !@publication.active)
    redirect_to publications_path, notice: "The publication's status was successfully updated."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_publication
    @publication = Publication.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def publication_params
    params.require(:publication).permit(:title, :content, :category_id)
  end
end
