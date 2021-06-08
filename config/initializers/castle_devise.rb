require 'castle_devise'

CastleDevise.configure do |config|
  config.api_secret = ENV.fetch('CASTLE_API_SECRET')
  config.app_id = ENV.fetch('CASTLE_APP_ID')
  config.logger = Rails.logger
end
