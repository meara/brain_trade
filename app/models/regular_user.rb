class RegularUser < User

	require 'bcrypt'
	has_secure_password

	validates_presence_of :first_name, :last_name, :email, :password, :on => :create
  validates_uniqueness_of :email
  validates :email, format: {with: /.+@.{2,}\.[a-zA-Z]{2,6}/, message: "- must be a valid format"}
  validates :password, length: { in: 6..20, message: "- must be between 6 and 20 characters" }, on: :create




end
