Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
    # scope: 'email, user_birthday, public_profile, read_stream', display: 'popup'
end
