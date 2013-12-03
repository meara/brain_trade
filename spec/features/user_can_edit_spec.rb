require 'spec_helper'

feature "user profile editing" do

  #Signup or Login
  scenario "user can edit their account information" do
    visit root_path
    @user = FactoryGirl.build(:regular_user)
    click_link "Sign Up or Login"
    current_path.should == new_user_path
    fill_in "regular_user[first_name]", :with => @user.first_name
    fill_in "regular_user[last_name]", :with => @user.last_name
    fill_in "regular_user[email]", :with => @user.email
    fill_in "regular_user[password]", :with => @user.password
    fill_in "regular_user[password_confirmation]", :with => @user.password_confirmation
    click_button "Create User"
    
    click_link "Edit"               # click logout
    fill_in "user[first_name]", :with => "Elainey"
    fill_in "user[last_name]", :with => "Bigcliff"
    fill_in "user[email]", :with => "elainen@mail.com"
    fill_in "user[password]", :with => "elaine_password"
    fill_in "user[password_confirmation]", :with => "elaine_password"
    click_button "Update User"
    #current_path.should == users_path # Test current path with user id?

  end
end
