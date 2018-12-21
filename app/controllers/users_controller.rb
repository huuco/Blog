class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.sort_by_name
  end
end
