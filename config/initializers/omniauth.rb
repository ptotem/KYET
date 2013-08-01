Rails.application.config.middleware.use OmniAuth::Builder do
  #require 'omniauth-facebook'
  configure do |config|
    config.path_prefix = '/auth'
  end

  #new for dev
  provider :facebook, '480101972083707', '7b9b044385242d0bc9de17cb60053cd6'

end

