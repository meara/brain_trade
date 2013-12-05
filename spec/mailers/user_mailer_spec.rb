require "spec_helper"

describe UserMailer do

  let(:meetup) {FactoryGirl.create(:meetup)}

  describe 'welcome email' do
    let(:user) {FactoryGirl.build(:user)}
    let(:email) {UserMailer.welcome_email(user)}
    it 'renders the subject' do
      email.subject.should == 'Welcome to BrainTrade'
    end

    it 'renders the receiver email' do
      email.to.should == [user.email]
    end

    it 'renders the sender email' do
      email.from.should == ['app19952162@heroku.com']
    end
  end

  describe 'contact teacher email' do
    let(:email) {UserMailer.contact_teacher(meetup)}
    it 'renders the subject' do
      email.subject.should == 'Someone wants to learn from you'
    end

    it 'renders the receiver email' do
      email.to.should == [meetup.offering.teacher.email]
    end

    it 'renders the sender email' do
      email.from.should == ['app19952162@heroku.com']
    end

  end

  describe 'learner accepted email' do
    let(:email) {UserMailer.learner_accepted(meetup)}
    it 'renders the subject' do
      email.subject.should == 'Your learning request'
    end

    it 'renders the receiver email' do
      email.to.should == [meetup.learner.email]
    end

    it 'renders the sender email' do
      email.from.should == ['app19952162@heroku.com']
    end
  end

  describe 'learner rejected email' do
    let(:email) {UserMailer.learner_rejected(meetup)}
    it 'renders the subject' do
      email.subject.should == 'Your learning request'
    end

    it 'renders the receiver email' do
      email.to.should == [meetup.learner.email]
    end

    it 'renders the sender email' do
      email.from.should == ['app19952162@heroku.com']
    end
  end

  describe 'teacher meetup confirmation email' do
    let(:email) {UserMailer.teacher_meetup_confirmation(meetup)}
    it 'renders the subject' do
      email.subject.should == 'Your meetup is confirmed!'
    end

    it 'renders the receiver email' do
      email.to.should == [meetup.offering.teacher.email]
    end

    it 'renders the sender email' do
      email.from.should == ['app19952162@heroku.com']
    end
  end

  describe 'learner meetup confirmation email' do
    let(:email) {UserMailer.learner_meetup_confirmation(meetup)}
    it 'renders the subject' do
      email.subject.should == 'Your meetup is confirmed!'
    end

    it 'renders the receiver email' do
      email.to.should == [meetup.learner.email]
    end

    it 'renders the sender email' do
      email.from.should == ['app19952162@heroku.com']
    end
  end

end
