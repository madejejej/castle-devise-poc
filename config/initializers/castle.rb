Castle.configure do |config|
  config.api_secret = ENV.fetch('CASTLE_API_SECRET')
  config.logger = Rails.logger
end
