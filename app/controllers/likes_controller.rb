class LikesController < ApplicationController
  before_action :load_post
  before_action :user_signed_in?

  def create
    unless liked? @post.id
      @like = current_user.likes.build
      @like.post = @post
    end
    respond_to {|format| format.js} if @like.save
  end

  def destroy
    @like = Like.find_by id:params[:id]
    respond_to {|format| format.js} if @like.destroy
  end

  private

  def load_post
    @post = Post.find_by id: params[:post_id]
    load_info @post
  end
end
