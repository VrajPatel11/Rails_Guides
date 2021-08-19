#The Logger

#rails use ActiveSupport::Logger to write log information
#to specify an alternative logger
config.logger = Logger.new(STDOUT)
config.logger = Log4r::Logger.new("Application Log")
#or in the Initializer section add
Rails.logger = Logger.new(STDOUT)
Rails.logger = Log4r::Logger.new("Application Log")

#log levels
#when something is logged, its printed to corrresponding log level and we can know the log level by
config.log_level = :warn # In any environment initializer, or
Rails.logger.level = 0 # at any time


#sending messages
#to write in current log use logger.(debug|info|warn|error|fatal|unknown)
logger.debug "Person attributes hash: #{@person.attributes.inspect}"
logger.info "Processing the request..."
logger.fatal "Terminating application, raised unrecoverable error!!!"


#tagged logging
#it helps to filter logs using custom rules when running multi-user applications
logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
logger.tagged("BCX") { logger.info "Stuff" }                            # Logs "[BCX] Stuff"
logger.tagged("BCX", "Jason") { logger.info "Stuff" }                   # Logs "[BCX] [Jason] Stuff"
logger.tagged("BCX") { logger.tagged("Jason") { logger.info "Stuff" } } # Logs "[BCX] [Jason] Stuff"
