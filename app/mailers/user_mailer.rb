class UserMailer < ActionMailer::Base
  default from: 'braintradeteam@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'localhost:3000'
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



end

#braintradeteam@gmail.com
#password: braintradeweb
#birthday Nov 30 1983
