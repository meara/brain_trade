class User < ActiveRecord::Base

  has_many :accounts, dependent: :destroy
  has_many :ratings, foreign_key: :learner_id
  has_many :learning_meetups, class_name: "Meetup", foreign_key: :learner_id
  has_many :offerings, foreign_key: :teacher_id
  has_many :teaching_meetups, through: :offerings, source: :meetups

  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :bio

  # VALIDATIONS
  # validates_presence_of :first_name, :last_name, :email, :password, :on => :create
  # validates_uniqueness_of :email
  # validates :email, format: {with: /.+@.{2,}\.[a-zA-Z]{2,6}/, message: "- must be a valid format"}
  # validates :password, length: { in: 6..20, message: "- must be between 6 and 20 characters" }, on: :create
  
  # require 'bcrypt'
  # has_secure_password 

  def has_facebook?
    accounts.where(provider: 'facebook').any?
  end

  def has_google?
    accounts.where(provider: 'google').any?
  end

end
