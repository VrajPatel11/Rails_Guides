#Creating A Job

#to create a new job
$ bin/rails generate job guests_cleanup
#invoke  test_unit
#create    test/jobs/guests_cleanup_job_test.rb
#create  app/jobs/guests_cleanup_job.rb

#a job looks like this
class GuestsCleanupJob < ApplicationJob

    def perform(*guests)
      # Do something later
    end
end
  

#Enque a job
# Enqueue a job to be performed as soon as the queuing system is
# free.
GuestsCleanupJob.perform_later guest

# `perform_now` and `perform_later` will call `perform` under the hood so
# you can pass as many arguments as defined in the latter.
GuestsCleanupJob.perform_later(guest1, guest2, filter: 'some_filter')
