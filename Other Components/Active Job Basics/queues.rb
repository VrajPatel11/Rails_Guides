#Queues

class GuestsCleanupJob < ApplicationJob
    queue_as :low_priority
    # ...
end
#we can also prefix the queue
# config/application.rb
module YourApp
    class Application < Rails::Application
      config.active_job.queue_name_prefix = Rails.env
    end
end
  
#configuring prefix
class GuestsCleanupJob < ApplicationJob
  queue_as :low_priority
  self.queue_name_prefix = nil
  # ...
end

# Now your job's queue won't be prefixed, overriding what
# was configured in `config.active_job.queue_name_prefix`.

# _ is default prefix delimeter it can be changed by
# config/application.rb
module YourApp
    class Application < Rails::Application
      config.active_job.queue_name_prefix = Rails.env
      config.active_job.queue_name_delimiter = '.'
    end
end
# app/jobs/guests_cleanup_job.rb
class GuestsCleanupJob < ApplicationJob
  queue_as :low_priority
  # ...
end

# Now your job will run on queue production.low_priority on your
# production environment and on staging.low_priority
# on your staging environment
