Devise.setup do |config|
  config.http_authenticatable_on_xhr = false
  config.navigational_formats = [:html, :json]
  config.mailer = "Devise::Async::Proxy"


end