FactoryGirl.define do 
	factory :user do 
		first_name "Clark"
		last_name "Kent"
		email "superman@mail.com"
		password "password"
    password_confirmation "password"
	end

	factory :rating do 
		score 1 
		review "You're the bee's knees"
		meetup_id 1
		learner_id 1 
	end

	factory :meetup do 
		offering_id 1
		learner_id 1
		method "google hangout"
		datetime Time.now
	end

	factory :offering do 
		subject_id 1 
		teacher_id 1
		hangout true 
		location "krypton"
	end

	factory :subject do 
		name "Ruby"
		category_id 1
	end


	factory :categories do 
		name "programming languages" 
	end
end





