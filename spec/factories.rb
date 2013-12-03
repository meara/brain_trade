FactoryGirl.define do 

	factory :regular_user, aliases: [:learner, :teacher] do 
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email { Faker::Internet.email("#{first_name} #{last_name}") }
    password "password"
    password_confirmation "password"
  end

	factory :rating do 
		score 1 
		review "You're the bee's knees"
		meetup
		learner
	end

	factory :offering do 
		hangout true 
		location "krypton"
		subject
		teacher
	end

	factory :meetup do
		method "hangout"
		date_time Time.now
		offering
		learner
	end


	factory :category do 
		name "Programming" 
	end

	factory :subject do 
		name "Ruby"
		category
	end

end

