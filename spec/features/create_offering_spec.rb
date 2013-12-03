require 'spec_helper'

feature "A user should be able to create a new offering" do
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

    category = FactoryGirl.create(:category)
		click_link 'New Offering'
		current_path.should == new_offering_path
    select 'Programming', from: 'offering_category'
		fill_in "offering_subject", :with => "Ruby"
		check 'offering_hangout'
		fill_in 'offering_location', :with => "starbucks"
		click_button 'Create'
	end
end 

