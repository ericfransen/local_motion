Rails.application.config.middleware.use OmniAuth::Builder do
  provider :uber, ENV['pusher_app_id'], ENV['pusher_secret']
end
