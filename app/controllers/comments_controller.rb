class CommentsController < ApplicationController
  before_action :load_post
  before_action :load_comment, only: %i(edit update destroy)
  before_action :authenticate_user!


  def create
    if params[:comment][:parent_id].present?
      parent = Comment.find_by id: params[:comment].delete(:parent_id)
      @comment = parent.children.build(comment_params)
      @comment.post = @post
      @comment.user = current_user
    else
      @comment = @post.comments.build comment_params
      @comment.user = current_user
    end

    if @comment.save
      respond_to do |format|
        format.html{redirect_back(fallback_location: root_path)}
        format.js
      end
    end
  end

  def edit
    respond_to {|format| format.js}
  end

  def update
    if @comment.update_attributes comment_params
      respond_to {|format| format.js}
    end
  end

  def destroy
    @comment.descendants.each do |comment_des|
      comment_des.destroy
    end
    @comment.destroy
    respond_to do |format|
      format.html{redirect_back(fallback_location: root_path)}
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
end
