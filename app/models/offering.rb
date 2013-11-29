class Offering < ActiveRecord::Base
  belongs_to :teacher, class_name: "User"
  has_many :meetups
  belongs_to :subject
end


