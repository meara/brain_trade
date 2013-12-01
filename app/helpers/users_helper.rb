module UsersHelper
	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=150"
		image_tag(gravatar_url, alt: user.first_name, class: "gravatar")
	end
end