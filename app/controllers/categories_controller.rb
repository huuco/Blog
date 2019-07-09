class CategoriesController < ApplicationController

  def index
    @categories = Category.by_created_at.page(params[:page]).per 5
  end


  def show
    @category = Category.find_by id: params[:id]
    load_info @category
  end

  def create
    @category = Category.new category_params
    if @category.save
      render  json: @category
    else
      respond_to do |format|
        format.js {render "error.js.coffee"}
      end
    end
  end

  private

  def category_params
    params.require(:category).permit :name
  end
end
