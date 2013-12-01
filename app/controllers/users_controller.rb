class UsersController < ApplicationController

  def index
   @users = User.all
  end

  def create
    #create account
    @user = User.create(params[:user])
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
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
      @user = User.find(session[:user_id])
      if request.xhr?
          render :edit, layout: false
      end                
  end


  def update
    #update profile
    @user = User.find(session[:user_id])
    # puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    # puts @user
    #  puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    if @user.update_attributes(params[:user])
        # puts "****************************************"
        flash[:success] = "Your info has been updated!"
        redirect_to users_path(@user)
    else
        flash[:error] = "Your info has had a problem updating. Try again"
        render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.destroy(session[:user_id])
    flash[:success] = "Your info has been deleted!"
    session[:user_id] = nil
    redirect_to(new_user_path)
  end

end
