module TeacherMeetupsHelper
	def all_meetups_as_teacher
		Meetup.includes(:offering).where('offerings.teacher_id = ?', teacher.id(@teacher)).references(:offerings).all 
	end

	def all_meetups_as_student
		Meetup.where("learner_id = ?", @learner.id)
	end


	#As the teacher user profile...
	def awaiting_teacher_response_as_teacher
		not_accepted = []
		all_meetups_as_teacher.each do |meetup|
			if meetup.accepted != true 
				not_accepted << meetup 
			end 
		end 
		not_accepted 
	end 


	def awaiting_student_response_as_teacher 
		not_confirmed = []
		all_meetups_as_teacher.each do |meetup|
			if meetup.accepted && meetup.date_time == nil 
				not_confirmed << meetup 
			end 
		end 
		not_confirmed 
	end 

	def confirmed_as_teacher 
		confirmed = []
		all_meetups_as_teacher do |meetup|
			if meetup.accepted && meetup.date_time 
				confirmed << meetup 
			end
		end
		confirmed 
	end

	#As the student user profile...
	def awaiting_teacher_response_as_student
		not_accepted = []
		all_meetups_as_student.each do |meetup|
			if meetup.accepted != true 
				not_accepted << meetup
			end
		end
		not_accepted
	end

	def awaiting_student_response_as_student
		not_confirmed = []
		all_meetups_as_student.each do |meetup|
			if meetup.accepted && meetup.date_time == nil 
				not_confirmed << meetup
			end
		end
		not_confirmed
	end

	def confirmed_as_student  
		confirmed = []
		all_meetups_as_student do |meetup|
			if meetup.accepted && meetup.date_time 
				confirmed << meetup 
			end 
		end 
		confirmed  
	end 
end 








