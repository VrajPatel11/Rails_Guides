#Configuring Rails Components

config.time_zone = 'Central Time (US & Canada)'

#we can also do with config object
config.active_record.schema_format = :ruby


#general configuration
config.after_initialize do
  ActionView::Base.sanitized_allowed_tags.delete 'div'
end
#it takes block which will run after Rails completes initializing application

#config.console allows to set class that will be used as console
console do
  # this block is called only when running console,
  # so we can safely require pry here
  require "pry"
  config.console = Pry
end

#config.logger is the logger that will be used for Rails.logger and any related Rails logging such as ActiveRecord::Base.logger
class MyLogger < ::Logger
  include ActiveSupport::LoggerSilence
end

mylogger           = MyLogger.new(STDOUT)
mylogger.formatter = config.log_formatter
config.logger      = ActiveSupport::TaggedLogging.new(mylogger)


#configuring generators
#rails allow to alter what generators are used
config.generators do |g|
  g.orm :active_record
  g.test_framework :test_unit
end


#configuring middeware
Rails.application.config.hosts = [
  IPAddr.new("0.0.0.0/0"), # All IPv4 addresses.
  IPAddr.new("::/0"),      # All IPv6 addresses.
  "localhost"              # The localhost reserved domain.
]

config.middleware.use Magical::Unicorns
#This will put the Magical::Unicorns middleware on the end of the stack

config.middleware.insert_before 0, Magical::Unicorns

#insert_after 
config.middleware.insert_after Rack::Head, Magical::Unicorns

#can be moved from one place to another
config.middleware.move_before ActionDispatch::Flash, Magical::Unicorns


#configuring i18n
#for using default locale as fallback
config.i18n.fallbacks = true

#array of locales
config.i18n.fallbacks = [:tr, :en]


#configuring action mailbox
config.action_mailbox.logger = ActiveSupport::Logger.new(STDOUT)

# Incinerate inbound emails 14 days after processing.
config.action_mailbox.incinerate_after = 14.days


#configuring active job
# Be sure to have the adapter's gem in your Gemfile
# and follow the adapter's specific installation
# and deployment instructions.
config.active_job.queue_adapter = :sidekiq

config.active_job.default_queue_name = :medium_priority
#to change default queue name

config.active_job.queue_name_prefix = Rails.env

class GuestsCleanupJob < ActiveJob::Base
  queue_as :high_priority
  #....
end

#configuring a database
#in config/database.yml
development:
  adapter: postgresql
  database: blog_development
  pool: 5
#it will connect to a database named blog_development using postgresql adapter

#we can manually specify a URL
development:
  url: postgresql://localhost/blog_development?pool=5


#connection preference
#in case of empty config/database.yml
cat config/database.yml
echo $DATABASE_URL

#in case of config/database.yml but no ENV['DATABASE_URL']
cat config/database.yml
echo $DATABASE_URL

#in case of both config/database.yml and ENV['DATABASE_URL']
cat config/database.yml
echo $DATABASE_URL
bin/rails runner 'puts ActiveRecord::Base.configurations'
bin/rails runner 'puts ActiveRecord::Base.configurations.inspect'


#configuring postgreSQL database
development:
  adapter: postgresql
  encoding: unicode
  database: blog_development
  pool: 5
