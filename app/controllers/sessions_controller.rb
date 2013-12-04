class SessionsController < ApplicationController

  skip_before_action :require_login
  skip_before_action :warn_not_logged_in

  def index
    #HOMEPAGE
  end

  def new
  end

  def create
    #Login authenication
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to user_path(@user)
    else
       flash[:error] = ["Invalid email or password"]
       redirect_to new_user_path
    end
  end

  def destroy
      session.clear
      redirect_to root_url
  end

end
