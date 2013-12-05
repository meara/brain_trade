class UserMailer < ActionMailer::Base
  default from: 'braintradeteam@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://braintrade.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to BrainTrade')
    #attachments.inline['braintrade_logo.png'] = File.read(Rails.root.join("/app/assets/images/braintrade_logo.png"))
  end

  def contact_teacher(meetup)
    @meetup = meetup
    #learner is current_user
    @learner = meetup.learner
    #get teacher from id in route
    @teacher = meetup.offering.teacher
    @learner_profile_link = "http://braintrade.herokuapp.com#{user_path(@learner)}"
    @meetup_link = "http://braintrade.herokuapp.com#{edit_meetup_path(@meetup)}"

    mail(to: @teacher.email, subject: 'Someone wants to learn from you')
  end

  def learner_accepted(meetup)
    @meetup = meetup
    @learner = meetup.learner
    @teacher = meetup.offering.teacher
    @meetup_link = "http://braintrade.herokuapp.com#{edit_meetup_path(@meetup)}"

    mail(to: @learner.email, subject: 'Your learning request')
  end

  def learner_rejected(meetup)
    @meetup = meetup
    @learner = meetup.learner
    @teacher = meetup.offering.teacher
    @learn_link = "http://braintrade.herokuapp.com/categories"

    mail(to: @learner.email, subject: 'Your learning request')
  end

  def teacher_meetup_confirmation(meetup)
    @meetup = meetup

    @learner = meetup.learner
    @teacher = meetup.offering.teacher
    @meetup_confirmation_link = "http://braintrade.herokuapp.com#{meetup_path(@meetup)}"
    @learner_profile_link = "http://braintrade.herokuapp.com#{user_path(@learner)}"


    mail(to: @teacher.email, subject: 'Your meetup is confirmed!')
  end

    def learner_meetup_confirmation(meetup)
    @meetup = meetup

    @learner = meetup.learner
    @teacher = meetup.offering.teacher
    @meetup_confirmation_link = "http://braintrade.herokuapp.com#{meetup_path(@meetup)}"

    mail(to: @learner.email, subject: 'Your meetup is confirmed!')
  end

  def learner_meetup_cancellation(meetup)
    @meetup = meetup

    @learner = meetup.learner
    @teacher = meetup.offering.teacher
    @meetup_confirmation_link = "http://braintrade.herokuapp.com#{meetup_path(@meetup)}"

    mail(to: @learner.email, subject: 'Your meetup is cancelled.')
  end


  def teacher_meetup_cancellation(meetup)
    @meetup = meetup

    @learner = meetup.learner
    @teacher = meetup.offering.teacher
    @meetup_confirmation_link = "http://braintrade.herokuapp.com#{meetup_path(@meetup)}"

    mail(to: @teacher.email, subject: 'Your meetup is cancelled.')
  end


end

#braintradeteam@gmail.com
#password: braintradeweb
#birthday Nov 30 1983

#Name: Godzilla Townsend
#godzillatownsend@gmail.com
#password: eatallthecake
#birthday June 13 1983
