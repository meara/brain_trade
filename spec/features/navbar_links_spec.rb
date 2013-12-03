require 'spec_helper'

feature "navbar links work" do

  #HOME
  scenario "click home" do
    visit root_path                        # visit homepage
    click_link "BrainTrade"               # click home/Put It Out
    current_path.should == root_path    # verify link
  end

  #SIGN UP, LOGOUT, LOGIN
  scenario "sign up, logout, login" do
    @user = FactoryGirl.build(:regular_user)
    p @user
    visit root_path                        # visit page where sessions are in session
    click_link "Sign Up or Login"
    current_path.should == new_user_path
    fill_in "regular_user[first_name]", :with => @user.first_name
    fill_in "regular_user[last_name]", :with => @user.last_name
    fill_in "regular_user[email]", :with => @user.email
    fill_in "regular_user[password]", :with => @user.password
    fill_in "regular_user[password_confirmation]", :with => @user.password_confirmation
    click_button "Create User"
    page.should have_content(@user.first_name)
    click_link "Logout"               # click logout
    current_path.should == root_path    # verify link
    
    click_link "Login"            #click login
    current_path.should == new_user_path
    fill_in "login_email", :with => @user.email
    fill_in "login_password", :with => @user.password
    click_button "login_user"
    page.should have_content(@user.first_name)    # verify link
  end

end
