class UserMailer < ActionMailer::Base
  default from: 'braintradeteam@gmail.com'

  def welcome_email(user)
    puts "%%%%%%%%%%%%%%%%%% welcome email is working"
    @user = user
    puts @user
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    @url  = 'localhost:3000'
    puts @url
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    mail(to: @user.email, subject: 'Welcome to BrainTrade')
    puts @user.email
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    #attachments.inline['braintrade_logo.png'] = File.read(Rails.root.join("/app/assets/images/braintrade_logo.png"))
    
  end

end

#braintradeteam@gmail.com
#password: braintradeweb
#birthday Nov 30 1983
