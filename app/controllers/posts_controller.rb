class PostsController < ApplicationController
  before_action :load_post, except: %i(create new index)
  before_action :authenticate_user!, except: %i(index show)

  def index
    @posts = Post.sort_by_updated
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    if @post.rates.blank?
      @average_rate = 0
    else
      @average_rate = @post.rates.average(:star).round(2)
    end
>>>>>>> 7acb049... add comment, edit comment, destroy comment

=======
    @rates = @post.rates
>>>>>>> 0553381... add like button, share
  end

=======

  end
>>>>>>> 4b64319... create post
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
