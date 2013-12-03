if Rails.env == 'development' || Rails.env == 'test'
	Rails.application.config.middleware.use OmniAuth::Builder do
		provider :facebook, "1452674754959375", "ac993740d834329066eb0f235e5e27d6"
		provider :google_oauth2, '468619758395-sg9u9o03m8q1atud5p2p6erh5ebco479.apps.googleusercontent.com', 'fZSOupB7joaWuPNcIhIjrUC7'
	  # provider :google_oauth2, ENV["CLIENTID"], ENV["CLIENTSECRET"]
	end
	else
  # Production
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, "1452674754959375", "ac993740d834329066eb0f235e5e27d6"
    provider :google_oauth2, '468619758395-sg9u9o03m8q1atud5p2p6erh5ebco479.apps.googleusercontent.com', 'fZSOupB7joaWuPNcIhIjrUC7'
  end
end
