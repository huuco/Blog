class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?
  before_action :load_post, only: %i(show update destroy)

  def index
    @posts = Post.sort_by_updated.page(params[:page]).per 10
  end

  def show
  end

  def update
    if @post.update_attributes post_params
      flash[:success] = t ".update_success"
    else
      flash[:danger] = t "update_failed"
    end
    redirect_to admin_posts_path @post
  end

  def destroy
    if @post.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_failed"
    end
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit :status
  end

  def load_post
    @post = Post.find_by id: params[:id]
    load_info @post
  end
end
