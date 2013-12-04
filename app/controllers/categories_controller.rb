class CategoriesController < ApplicationController

  skip_before_action :require_login
  skip_before_action :warn_not_logged_in

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by_id(params[:id])
    @subjects = @category.subjects.all
  
  end

end
