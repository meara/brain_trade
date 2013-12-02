class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by_id(params[:id])
    @subjects = @category.subjects.all
    if request.xhr?
        render :show, layout: false
    end 
  end

end
