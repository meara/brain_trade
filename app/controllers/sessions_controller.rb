class SessionsController < ApplicationController

  def index
    #HOMEPAGE
  end

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user == nil
      flash[:error] = "The user you have entered does not exist"
      redirect_to login_path
    else
       if @user.password == params[:password]
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:error] = "Username or Password is incorrect"
          redirect_to root_path
        end
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
