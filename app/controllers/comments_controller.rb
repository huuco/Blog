class CommentsController < ApplicationController
  before_action :load_post
  before_action :load_comment, only: %i(edit update destroy)
  before_action :authenticate_user!


  def create
    @comment = @post.comments.build comment_params
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.js
      end
    end
  end

  def new
    @comment = @commentable.comments.new
    @comment.parent_id = params[:parent_id]
    respond_to do |format|
      format.html
      format.js
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

  def comment_params
    params.require(:comment).permit :content
  end

  def load_post
    @post = Post.find_by id: params[:post_id]
    load_info @post
  end

  def load_comment
    @comment = @post.comments.find_by id: params[:id]
    load_info @comment
  end

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
