OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do

  provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET'] #,:scope => "userinfo.email, userinfo.profile", :display => 'popup'
end

#'468619758395-sg9u9o03m8q1atud5p2p6erh5ebco479.apps.googleusercontent.com', 'fZSOupB7joaWuPNcIhIjrUC7'

# export GOOGLE_KEY='468619758395-sg9u9o03m8q1atud5p2p6erh5ebco479.apps.googleusercontent.com'
# export GOOGLE_SECRET='fZSOupB7joaWuPNcIhIjrUC7'