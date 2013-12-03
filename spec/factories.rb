FactoryGirl.define do 
  # CODE REVIEW: I prefer to fill in factories with Faker data. I'd write the
  # user factory as such (personally)
  # factory :user do 
  #   first_name Faker::Name.first_name
  #   last_name Faker::Name.last_name
  #   email { Faker::Internet.email("#{first_name} #{last_name}") }
  #   password "password"
  #   password_confirmation "password"
  # end
  # This will result in mostly random users, with emails that match""
	factory :user do 
		first_name "Clark"
		last_name "Kent"
		email "superman@mail.com"
		password "password"
    password_confirmation "password"
	end

  # CODE REVIEW: Factory that depends on other "models" (Factories)
  # factory :rating do 
  #   score 1 
  #   review "You're the bee's knees"
  #   association :meetup
  #   association :learner, factory: :user
  # end
	factory :rating do 
		score 1 
		review "You're the bee's knees"
		meetup_id 1
		learner_id 1 
	end

	factory :meetup do 
		offering_id 1
		learner_id 1
		method "hangout"
		datetime Time.now
	end

	factory :offering do 
		subject_id 1 
		teacher_id 1
		hangout true 
		location "krypton"
	end

	factory :category do 
		name "Programming" 
	end

	factory :subject do 
		name "Ruby"
		category_id 1
	end

end





