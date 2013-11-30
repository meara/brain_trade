require 'spec_helper'
require 'date'

describe Meetup do
  let(:meetup) { meetup = Meetup.new(offering_id: 1, learner_id: 1, method: "hello", date_time: DateTime.now) }

    it 'can be created' do
      expect(meetup).to_not be_nil
    end

    it 'has an offering_id' do
      expect(meetup.offering_id).to be_a(Integer)
    end

    it 'has a learner_id' do
      expect(meetup.learner_id).to be_a(Integer)
    end

    it 'has a method' do 
      expect(meetup.method).to be_a(String)
    end

    it 'has a date and time' do 
      expect(meetup.date_time).to_not be_nil
    end
  end
