#Running Standalone Cable Servers

#In app
# config/application.rb
class Application < Rails::Application
  config.action_cable.mount_path = '/websocket'
end
  
#Standalone
# cable/config.ru
require_relative "../config/environment"
Rails.application.eager_load!

run ActionCable.server
#start server using binstub in bin/cable
#!/bin/bash
bundle exec puma -p 28080 cable/config.ru
