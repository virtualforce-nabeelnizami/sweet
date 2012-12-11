Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for facebook
#  provider :facebook, [APP ID], [SECRET KEY], {:scope =&gt; 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
#  config.omniauth :facebook, "APP_ID", "APP_SECRET”
# config.omniauth :facebook, '232566186876778', '513a68a19c539ae02332b8eb954fcc97'
  # If you want to also configure for additional login services, they would be configured here.
end