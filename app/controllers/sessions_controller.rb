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
    redirect_to  root_path
  end

  def createoauth
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.name == nil
      UserMailer.welcome_email(user).deliver
      flash[:success] = "By Joining BrainTrade you have earned one free credit toward learing."
    end
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

end
