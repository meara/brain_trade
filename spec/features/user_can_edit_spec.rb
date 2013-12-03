require 'spec_helper'

feature "user profile editing" do

  #Signup or Login
  scenario "user can edit their account information" do
    visit root_path
    user = FactoryGirl.build(:user)
    click_link "Sign Up or Login"
    current_path.should == new_user_path
    fill_in "user_first_name", :with => user.first_name
    fill_in "user_last_name", :with => user.last_name
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => user.password
    fill_in "user_password_confirmation", :with => user.password_confirmation
    click_button "Create User"
    current_path.should == user_path(user)
    
    click_link "Edit"               # click logout
    fill_in "user_first_name", :with => "Elainey"
    fill_in "user_last_name", :with => "Bigcliff"
    fill_in "user_email", :with => "elainen@mail.com"
    fill_in "user_password", :with => "elaine_password"
    fill_in "user_password_confirmation", :with => "elaine_password"
    click_button "Update User"
    #current_path.should == users_path # Test current path with user id?

  end
end
