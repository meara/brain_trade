require 'spec_helper'

describe Category do 
  let(:category) { category = Category.new(name: "Ruby") }

  it "has a name" do
    expect(category.name).to be_a(String)
  end

  it "can be created" do 
    expect(category.name).to_not be_nil
  end
end
