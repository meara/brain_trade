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
    visit root_path                        # visit page where sessions are in session
    click_link "Sign Up or Login"
    current_path.should == new_user_path
    fill_in "user_first_name", :with => "Elaine"
    fill_in "user_last_name", :with => "Yu"
    fill_in "user_email", :with => "test_person@mail.com"
    fill_in "user_password", :with => "test_person_password"
    fill_in "user_password_confirmation", :with => "test_person_password"
    click_button "Create User"
    current_path.should == 'users/1'
    
    click_link "Logout"               # click logout
    current_path.should == root_path    # verify link
    
    click_link "Login"            #click login
    current_path.should == new_user_path
    fill_in "login_email", :with => "test_person@mail.com"
    fill_in "login_password", :with => "test_person_password"
    click_button "login_user"
    current_path.should == 'users/1'    # verify link
  end

end
