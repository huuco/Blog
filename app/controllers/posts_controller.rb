class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i(index show)
  before_action :load_post, except: %i(create new index)

  def index
    @search = Post.ransack params[:q]
    @search.sorts = Post.order(created_at: :desc) if @search.sorts.empty?
    @posts = @search.result.post_filter.joins(:category)
    .page(params[:page]).per 10
    @post_hostest_week =  Post.post_filter.show_post_host
    @category_relates = Post.post_filter.show_blog_category_interested
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
    @supports = Supports::Post.new @post
  end

  def destroy
    if @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
        format.js { head :no_content }
      end
    else
      flash[:danger] = t ".failed_delete"
      redirect_to root_url
    end
  end

  private

  def post_params
    params.require(:post).permit :title, :content, :picture,
     :picture_cache, :category_id
  end

  def load_post
    @post = Post.find_by id: params[:id]
    load_info @post
  end
end
