class StaticPagesController  < ApplicationController
  def home
    @posts = Post.post_filter.page(params[:page]).per 10
  end
end
