class Rating < ActiveRecord::Base
  belongs_to :learner, class_name: "User"
end
