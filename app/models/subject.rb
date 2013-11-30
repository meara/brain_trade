class Subject < ActiveRecord::Base
  belongs_to :category
  has_many :offerings

  attr_accessible :name, :category_id
end
