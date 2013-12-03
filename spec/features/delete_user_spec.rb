require 'spec_helper'

feature "A user should be able to delete their account" do
	scenario "when signed in" do 
		user = FactoryGirl.build(:user)
		visit root_path
    click_link "Sign Up or Login"
    current_path.should == new_user_path
  	
  	fill_in "user_first_name", :with => user.first_name
    fill_in "user_last_name", :with => user.last_name
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => user.password
    fill_in "user_password_confirmation", :with => user.password_confirmation
    click_button "Create User" 

		click_link 'Delete User' 
		# page.driver.browser.accept_js_confirms 

		expect(page).to have_text("Create Account") 
		current_path.should == new_user_path
	end 
end 


