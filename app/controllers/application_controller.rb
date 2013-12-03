class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login, only: [:create, :update]
 
  private
 
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_path # halts request cycle
    end
  end

  def current_user
    current_user = User.find_by_id(session[:user_id])
  end

end
