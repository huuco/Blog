class PostsController < ApplicationController
  before_action :load_post, except: %i(create new index)
  before_action :authenticate_user!, except: %i(index show)

  def index
    @search = Post.search params[:q]
    @search.sorts = Settings.default_sort if @search.sorts.empty?
    @posts = @search.result.includes(:categories, :post_categories)

  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      flash[:success] = t ".create_post"
      redirect_to @post
    else
      render :new
    end
  end

  def edit; end

  def update
    @post.update_attributes post_params
    if @post.save
      flash[:success] = t ".update_success"
      redirect_to @post
    else
      render :edit
    end
  end

  def show
    @rates = @post.rates
  end

  def destroy
    if @post.destroy
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = t ".fail_delete"
    end
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit :title, :content, :picture,
     :picture_cache, :list_categories
  end

  def load_post
    @post = Post.find_by id: params[:id]
    load_info @post
  end
end
