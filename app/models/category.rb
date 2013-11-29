class Category < ActiveRecord::Base
  has_many :subjects
end
