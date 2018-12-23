class CommentsController < ApplicationController
  before_action :load_post
  before_action :load_comment, only: %i(edit update destroy)
  before_action :authenticate_user!

  def create
    @comment = @post.comments.build comment_params
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
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
    @comment.update_attributes comment_params
    if @comment.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit :user_id, :post_id, :content
  end

  def load_post
    @post = Post.find_by id: params[:post_id]
    load_info @post
  end

  def load_comment
    @comment = @post.comments.find_by id: params[:id]
    load_info @comment
  end
end
