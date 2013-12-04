class User < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :bio

  has_many :ratings, foreign_key: :learner_id
  has_many :learning_meetups, class_name: "Meetup", foreign_key: :learner_id
  has_many :offerings, foreign_key: :teacher_id
  has_many :teaching_meetups, through: :offerings, source: :meetups

  # VALIDATIONS
  validates_presence_of :first_name, :last_name, :email, :password, :on => :create
  validates_uniqueness_of :email
  validates :email, format: {with: /.+@.{2,}\.[a-zA-Z]{2,6}/, message: "- must be a valid format"}
  validates :password, length: { in: 6..20, message: "- must be between 6 and 20 characters" }, on: :create
  
  has_secure_password 

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.username = auth.info.name
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid.to_i
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.password = "password"
      user.password_confirmation = "password"
      if user.oauth_expires_at!=nil
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      end
      if User.find_by_email(user.email)
        user.name = "exists" 
      else
        user.name = nil 
        user.credit += 1
      end
      user.save!
    end
  end


end
