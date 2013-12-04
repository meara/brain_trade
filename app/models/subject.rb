class Subject < ActiveRecord::Base
  belongs_to :category
  has_many :offerings

  attr_accessible :name, :category_id

    def self.search(search)
      if search
        where 'name iLIKE ?', "%#{search}%"
      else
        scoped
      end
    end
end
