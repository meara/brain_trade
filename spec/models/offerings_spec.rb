require 'spec_helper'

describe Offering do
  let(:offering) { offering = Offering.new(subject_id: 1, teacher_id: 1, hangout: true, location: "home")}

  it 'can be created' do
    expect(offering).to_not be_nil
  end

  it 'has a subject_id' do
    expect(offering.subject_id).to be_a(Integer)
  end

  it 'has a teacher_id' do
    expect(offering.teacher_id).to be_a(Integer)
  end

  it 'has a hangout value' do
    expect(offering.hangout).to be_a(TrueClass)
  end

  it 'has a location' do
    expect(offering.location).to be_a(String)
  end
end
