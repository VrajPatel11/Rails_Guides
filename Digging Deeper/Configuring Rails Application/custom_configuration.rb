#Custom configuration

config.x.payment_processing.schedule = :daily
config.x.payment_processing.retries  = 3
config.super_debugger = true

#they are then available through configuration object
Rails.configuration.x.payment_processing.schedule # => :daily
Rails.configuration.x.payment_processing.retries  # => 3
Rails.configuration.x.payment_processing.not_set  # => nil
Rails.configuration.super_debugger                # => true

#we can use Rails::Application.config_for to load whole configuration files
# config/payment.yml:
production:
  environment: production
  merchant_id: production_merchant_id
  public_key:  production_public_key
  private_key: production_private_key

development:
  environment: sandbox
  merchant_id: development_merchant_id
  public_key:  development_public_key
  private_key: development_private_key

# config/application.rb
module MyApp
  class Application < Rails::Application
    config.payment = config_for(:payment)
  end
end
  
Rails.configuration.payment['merchant_id'] # => production_merchant_id or development_merchant_id
