require 'rails_api_auth'

RailsApiAuth.tap do |raa|
  raa.user_model_relation = :user

  raa.facebook_app_id       = '382820178724645'
  raa.facebook_app_secret   = '809a7a9aeea42107cd6f21a33e2624ec'
  raa.facebook_redirect_uri = 'https://localhost:4200/about'

  raa.google_client_id     = '391159993660-70se4jcll933rh4f896takormj0rnlbc.apps.googleusercontent.com'
  raa.google_client_secret = 'T158hq7BK3GDglIqTxFIQD2x'
  raa.google_redirect_uri  = 'https://lvh.me:4200/torii/redirect.html'

  # Edx configurations
  # Has to be included with empty strings
  # Seems like a bug but:
  # https://github.com/simplabs/rails_api_auth#configuration
  raa.edx_client_id     = '<your Edx client id>'
  raa.edx_client_secret = '<your Edx client secret>'
  raa.edx_domain        = '<your Edx app domain>'
  raa.edx_redirect_uri  = 'your Edx app redirect uri'

  raa.force_ssl = false
end
