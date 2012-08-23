Devise.setup do |config|
  config.http_authenticatable_on_xhr = false
  config.navigational_formats = [:html, :json]
#  config.mailer = "Ign6::Application::Mailer"
  config.mailer_sender = "admin@ign.su"

end#