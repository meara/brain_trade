require 'spec_helper'

# CODE REVIEW: coverage report is 100%, but there are things in your model not
# tested here. I don't really love these tests either. What are they testing?
# How would this be helpful to you if you were looking at them for the first
# time?
describe Category do 
  let(:category) { category = Category.new(name: "Ruby") }

  it "has a name" do
    expect(category.name).to be_a(String)
  end

  # CODE REVIEW: this assertion does not match the test
  it "can be created" do 
    expect(category.name).to_not be_nil
  end
end
