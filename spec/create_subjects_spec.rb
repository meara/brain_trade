require 'spec_helper'

describe Subject do 
	let(:subject) { subject = Subject.new(name: "computer languages", category_id: 1) }

	it "can be created" do 
		expect("subject.name").to be_a(String)
	end

	it "has a category_id" do 
		expect(subject.category_id).to be_a(Integer)
	end
end
