class UsersController < ApplicationController

  def index
    #my account information
   @user = User.find(session[:user_id])
  end

  def create
    #create account
    @user = User.create(params[:user])
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to users_path
    else
       flash[:error] = @user.errors.full_messages
       render :new
    end
  end

  def new
    #Account creation form
    @user = User.new
  end

  def edit
    #edit profile page form
    #Broken
      @user = User.find(session[:user_id])                
      
  end

  def show
    #profile page (things to teach and learn)
     @user = current_user
  end

  def update
    #update profile
    #Broken
    @user = User.find(session[:user_id])
    if @user.update_attributes(params[:user])
        flash[:success] = "Your info has been updated!"
        redirect_to users_path(@user)
    else
        render :edit
    end
  end

  def destroy
  end

end
