Rails.application.config.middleware.use OmniAuth::Builder do
  provider :uber, ENV['pusher_app_id'], ENV['pusher_secret']
end

if Rails.env.production?
  OmniAuth.config.full_host = "https://localmotion.me"
end
