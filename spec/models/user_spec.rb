require 'spec_helper'

# CODE REVIEW: coverage report is 100%, but there are TONS of things in your
# model not tested here. I don't really love these tests either. What are they
# testing? How would this be helpful to you if you were looking at them for 
# the first time?
describe User do 
  let(:user) { user = User.new(first_name: "Connor", 
                               last_name: "McCrone", 
                               email: "con@mail.com", 
                               password: "password", 
                               password_confirmation: 'password',
                               bio: "This is a fake bio" ) }

  it 'can be created' do 
    expect(user).to_not be_nil
  end

  it 'has a first_name' do 
    expect(user.first_name).to be_a(String)
  end

  it 'has a last_name' do 
    expect(user.last_name).to be_a(String)
  end

  it 'has an email' do 
    expect(user.email).to be_a(String)
  end

  it 'has a password' do 
    expect(user.password_digest).to be_a(String)
  end

  it 'has a bio' do 
    expect(user.bio).to be_a(String)
  end
end
