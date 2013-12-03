class Account < ActiveRecord::Base
  belongs_to :user

  attr_accessible :user_id, :oauth_expires, :oauth_token, :provider, :uid, :username, :oauth_secret
end
