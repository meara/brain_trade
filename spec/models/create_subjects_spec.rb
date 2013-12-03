# CODE REVIEW: what is up with the name of this spec file?
require 'spec_helper'

# CODE REVIEW: coverage report is 100%, but there are things in your model not
# tested here. I don't really love these tests either. What are they testing?
# How would this be helpful to you if you were looking at them for the first
# time?
describe Subject do 
	let(:subject) { subject = Subject.new(name: "computer languages", category_id: 1) }

	it "can be created" do 
		expect("subject.name").to be_a(String)
	end

	it "has a category_id" do 
		expect(subject.category_id).to be_a(Integer)
	end
end
