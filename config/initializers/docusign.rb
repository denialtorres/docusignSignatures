DocusignRest.configure do |config|
  config.username = Rails.application.secrets.docusign_username
  config.password = Rails.application.secrets.docusign_password
  config.integrator_key = Rails.application.secrets.docusign_integrator_key
  config.account_id = Rails.application.secrets.docusign_account_id
end
