class Category < ActiveRecord::Base
  has_many :subjects

  attr_accessible :name
end
