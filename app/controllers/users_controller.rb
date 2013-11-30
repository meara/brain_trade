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
      @user = User.find(session[:user_id])
      if request.xhr?
          render :edit, layout: false
      end                
  end


  def update
    #update profile
    @user = User.find(session[:user_id])
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts @user
     puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    if @user.update_attributes(params[:user])
        puts "****************************************"
        flash[:success] = "Your info has been updated!"
        redirect_to users_path(@user)
    else
        flash[:success] = "Your info has had a problem updating. Try again"
        render :edit
    end
  end

  def show
    #profile page (things to teach and learn)
     #@user = current_user
  end
  def destroy
  end

end
