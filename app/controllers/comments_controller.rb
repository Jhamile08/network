class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  # GET /comments
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @publication = Publication.find(params[:publication_id])
    @comment = @publication.comments.build
    respond_to do |format|
      format.html # Este formato cargará la página completa
      format.js   # Este formato se utiliza para manejar AJAX
    end
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @publication = Publication.find(params[:publication_id])
    @comment = @publication.comments.build(comment_params)

    if @comment.save
      redirect_to @publication, notice: 'Comment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @publication, notice: 'Comment was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to publication_path(@comment.publication), notice: 'Comment was successfully destroyed.',
                                                        status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
    return if @comment

    redirect_to comments_path, alert: 'publication not found.'
  end

  def set_publication
    @publication = Publication.find_by(id: params[:publication_id])
    return if @publication

    redirect_to publications_path, alert: 'publication not found.'
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content)
  end
end
