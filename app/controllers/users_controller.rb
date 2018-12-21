class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
<<<<<<< HEAD
    @users = User.sort_by_name.page(params[:page]).per 10
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user
    redirect_to root_url
=======
    @users = User.sort_by_name
>>>>>>> c312721... signup-login-edit-user
  end
end
