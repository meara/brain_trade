class User < ActiveRecord::Base

  has_many :ratings, foreign_key: :learner_id
  has_many :learning_meetups, class_name: "Meetup", foreign_key: :learner_id
  has_many :offerings, foreign_key: :teacher_id
  has_many :teaching_meetups, through: :offerings, source: :meetups

end
