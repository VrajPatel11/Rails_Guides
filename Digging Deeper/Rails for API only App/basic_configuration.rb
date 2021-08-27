#Using rails on API only application

#The Basic Configuration

rails new my_api --api
#it will create a new application

config.api_only = true
#to change an existing application

config.debug_exception_response_format = :default
#to render HTML page with debugginf information

#inside application_controller change
class ApplicationController < ActionController::Base
end

#to
class ApplicationController < ActionController::API
end

