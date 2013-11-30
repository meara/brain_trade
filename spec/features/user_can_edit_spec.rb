require 'spec_helper'

feature "user profile editing" do

  #Signup or Login
  scenario "user can edit their account information" do
    visit root_path
    click_link "Sign Up or Login"
    current_path.should == new_user_path
    fill_in "user_first_name", :with => "Elaine"
    fill_in "user_last_name", :with => "Yu"
    fill_in "user_email", :with => "test_person@mail.com"
    fill_in "user_password", :with => "test_person_password"
    fill_in "user_password_confirmation", :with => "test_person_password"
    click_button "Create User"
    current_path.should == users_path
    
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
