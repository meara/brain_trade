class Meetup < ActiveRecord::Base
  belongs_to :learner, class_name: "User"
  belongs_to :offering

  attr_accessible :method, :learner_id, :offering_id, :date_time
end
