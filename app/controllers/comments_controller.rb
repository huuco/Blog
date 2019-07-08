class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_commentable
  before_action :load_comment, only: %i(reply edit update destroy)

  def reply
    @reply = @commentable.comments.build parent: @comment
  end

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @commentable, notice: "Created comment successfully" }
        format.json { render json: @comment }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :new, notice: "Create comment failly" }
        format.json { render json: @comment.errors }
        format.js
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    if @comment.update_attributes comment_params
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def load_comment
    @comment = @commentable.comments.find_by id: params[:id]
    load_info @comment
  end
  
  def comment_params
    params.require(:comment).permit :content, :parent_id
  end
end
