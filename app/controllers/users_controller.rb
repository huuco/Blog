class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.sort_by_name.page(params[:page]).per 10
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user
    redirect_to root_url
  end
end
