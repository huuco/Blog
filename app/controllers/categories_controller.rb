class CategoriesController < ApplicationController
  def show
    @category = Category.find_by id: params[:id]
    load_info @category
  end
end
