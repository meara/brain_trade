class SessionsController < ApplicationController

  def index
    #HOMEPAGE
  end

  def new
  end

  def create
    #Login authenication
    # auth_hash = request.env['omniauth.auth']
    # p render :text => auth_hash.inspect
    if request.env["omniauth.auth"].present?
      oauth = OAuthUser.new(request.env["omniauth.auth"], current_user)
      oauth.login_or_create
      session[:user_id] = oauth.user.id
      @user = 
      redirect_to root_path

    else
      @user = RegularUser.find_by_email(params[:email])
      if @user && @user.authenticate(params[:password])
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
