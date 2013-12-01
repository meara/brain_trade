

class MeetupsController < ApplicationController

  def show
    @meetup = Meetup.find(params[:id])
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
    #generates an email to the teacher containing a link to edit
  end

  def edit
    @meetup = Meetup.find(params[:id])
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
    p params[:meetup]["time1(1i)"].to_i
    time1 = Time.new(params[:meetup]["time1(1i)"].to_i, params[:meetup]["time1(2i)"].to_i, params[:meetup]["time1(3i)"].to_i, params[:meetup]["time1(4i)"].to_i, params[:meetup]["time1(5i)"].to_i)
    time2 = Time.new(params[:meetup]["time2(1i)"].to_i, params[:meetup]["time2(2i)"].to_i, params[:meetup]["time2(3i)"].to_i, params[:meetup]["time2(4i)"].to_i, params[:meetup]["time2(5i)"].to_i)
    time3 = Time.new(params[:meetup]["time3(1i)"].to_i, params[:meetup]["time3(2i)"].to_i, params[:meetup]["time3(3i)"].to_i, params[:meetup]["time3(4i)"].to_i, params[:meetup]["time3(5i)"].to_i)
    @meetup = Meetup.find(params[:id])
    @meetup.update(time1: time1, time2: time2, time3: time3)
    redirect_to(meetup_path(@meetup.id))
    # p Time.new(params[:time2][:1i], params[:time2][:2i], params[:time2][:3i], params[:time2][:4i], params[:time2][:5i])
    # p Time.new(params[:time3][:1i], params[:time3][:2i], params[:time3][:3i], params[:time3][:4i], params[:time3][:5i])

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
