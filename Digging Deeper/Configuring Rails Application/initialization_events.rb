#Initialization Events

#before initialize
module YourApp
  class Application < Rails::Application
    config.before_initialize do
      # initialization code goes here
    end
  end
end
  
Rails.application.config.before_initialize do
  # initialization code goes here
end
  
#Rails::Railtie#initializer
#several initializers that run on startup
initializer "action_controller.set_helpers_path" do |app|
  ActionController::Helpers.helpers_path = app.helpers_paths
end

