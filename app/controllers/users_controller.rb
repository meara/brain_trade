class UsersController < ApplicationController
  include ApplicationHelper

  before_filter :authenticate_user!, only: [:edit, :update]


  def new
    #Account creation form
    @user = RegularUser.new
  end

  def index
   @users = User.all
  end

  def create
    #create account
    @user = RegularUser.new(params[:regular_user])
    #respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        @user.credit += 1
        @user.save
        flash[:success] = "By Joining BrainTrade you have earned one free credit toward learing."
        UserMailer.welcome_email(@user).deliver
        #format.json { render json: @user, status: :created, location: @user }
        redirect_to user_path(@user)
        #format.html { redirect_to(@user, notice: 'User was successfully created.') }
      else
         flash[:error] = @user.errors.full_messages
         redirect_to new_user_path
      end
     #end
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
    if @user.update_attributes(params[:user])
        flash[:success] = "Your info has been updated!"
        redirect_to user_path(@user)
    else
        flash[:error] = "Your info has had a problem updating. Try again"
        render :edit
    end
  end

  def show
    @user = current_user
  end

  def destroy
    User.destroy(session[:user_id])
    flash[:success] = "Your info has been deleted!"
    session[:user_id] = nil
    redirect_to(new_user_path)
  end

end
