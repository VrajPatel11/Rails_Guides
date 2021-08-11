#Callbacks

class GuestsCleanupJob < ApplicationJob
  queue_as :default

  around_perform :around_cleanup

  def perform
    # Do something later
  end

  private
    def around_cleanup
      # Do something before perform
      yield
      # Do something after perform
    end
end
  
#before_enqueue around_enqueue after_enqueue before_perform around_perform after_perform
#These are the available callbacks in rails