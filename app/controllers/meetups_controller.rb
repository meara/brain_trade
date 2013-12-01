class MeetupsController < ApplicationController

  def show
    #details of agreed-upon meetup
    #include a link to cancel meetup, links to edit
  end

  def new
    #served when learner clicks button to learn topic from teacher
    #has a form where learner can write a message that will be sent in email
    #if hangout or in person are both possible, user picks one
    #submit button calls create
  end

  def create
    #creates a new meetup entry in table using learner and offering
    @meetup = Meetup.create(offering_id: params[:"data-offering_id"] , learner_id: current_user.id, method: 'hangout', )    
    # puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    # puts @meetup.inspect
    # puts "wheeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
    # puts params.inspect
    # puts "%%%%%%%%%%%%%%%"

    #generates an email to the teacher containing a link to edit
    UserMailer.contact_teacher(@meetup).deliver
    redirect_to meetup_path(@meetup)    
  end

  def edit
    #multiple possible views depending on what step in process

    #if meetup.accepted is false or nil (step 1)
      #form is for teacher
      #teacher may accept or reject learning request
      #if accepted, teacher must supply up to 3 options for times
      #submit calls update

    #if meetup.accepted == true and datetime is still nil (step 2)
      #form is for learner
      #learner picks a time or cancels request if no time is possible (option for cancel message)
      #submit calls update

    #if either user needs to cancel request after it's been confirmed
    #i.e. meetup.accepted == true and datetime is not nil
      #provide a text box for a message to other user about why cancelling
      #submit button says 'cancel', calls update

  end

  def update
    #if coming from step 1
      #update accepted field with true or false
      #if accepted, update dt_opts
      #generate email to learner with link to edit if accepted or :( if rejected
    #if coming from step 2
      #update datetime field with chosen date OR update cancelled to true
      #if date chosen, generate confirmation email to both teacher and learner
      #if meetup is cancelled, generate email to both saying cancelled
    #if cancelling after the fact
      #generate email to both saying cancelled with message
  end


  private

  #helper methods for the edit and update actions would go here

end
