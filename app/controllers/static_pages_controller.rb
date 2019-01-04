class StaticPagesController  < ApplicationController
  def home
    @posts = Post.post_filter.page(params[:page]).per Settings.post.paginate_post
  end
end
