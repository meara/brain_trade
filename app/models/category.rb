class Category < ActiveRecord::Base
  has_many :subjects

  attr_accessible :name

  def self.search(search)
    if search
      where 'name iLIKE ?', "%#{search}%"
    else
      scoped
    end
  end

end
