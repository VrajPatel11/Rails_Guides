#Job Execution

#setting backend
# config/application.rb
module YourApp
    class Application < Rails::Application
      # Be sure to have the adapter's gem in your Gemfile
      # and follow the adapter's specific installation
      # and deployment instructions.
      config.active_job.queue_adapter = :sidekiq
    end
end
  