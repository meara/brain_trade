class CategoriesController < ApplicationController

  skip_before_action :require_login
  skip_before_action :warn_not_logged_in

  def index
    @categories = Category.search(params[:search])
    # @categories = Category.all
  end

  def show
    @category = Category.find_by_id(params[:id])

    if Subject.search(params[:search]).present?
      #@subjects = Subject.search(params[:search])#.find_by(category_id: @category.id)
      @subjects = Subject.search(params[:search]).where(:category_id => @category.id)
    else
      @subjects = @category.subjects.all
    end
  end

end
