class SessionsController < ApplicationController

  def index
    #HOMEPAGE
  end

  def new
  end

  def create
    if request.env["omniauth.auth"].present?
      oauth = OAuthUser.new(request.env["omniauth.auth"], current_user)
      oauth.login_or_create
      session[:user_id] = oauth.user.id
      @user = User.find(session[:user_id])
      UserMailer.welcome_email(@user).deliver
      redirect_to user_path(session[:user_id])

    else
      @user = RegularUser.find_by_email(params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
         session[:user_id] = @user.id
         redirect_to user_path(@user)
      else
         flash[:error] = ["Invalid email or password"]
         redirect_to new_user_path
      end
    end
  end

  def destroy
      session.clear
      redirect_to root_url
  end

end
