class Admin::CommentsController < ApplicationController
  def new
    @comment = Comment.new
    redirect_to admin_posts_path
  end
end