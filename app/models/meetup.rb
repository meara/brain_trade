class Meetup < ActiveRecord::Base
  belongs_to :learner, class_name: "User"
  belongs_to :offering
end
