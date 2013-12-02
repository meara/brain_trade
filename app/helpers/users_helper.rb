module UsersHelper
	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=150"
		image_tag(gravatar_url, alt: user.first_name, class: "gravatar")
	end

  def all_meetups_as_teacher
    Meetup.includes(:offering).where('offerings.teacher_id = ?', current_user.id).references(:offerings).all 
  end

  def all_meetups_as_student
    Meetup.where("learner_id = ?", current_user.id)
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
