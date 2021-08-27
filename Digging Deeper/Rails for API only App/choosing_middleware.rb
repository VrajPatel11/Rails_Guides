#Choosing Middleware

#default middlewares
ActionDispatch::HostAuthorization
Rack::Sendfile
ActionDispatch::Static
ActionDispatch::Executor
ActiveSupport::Cache::Strategy::LocalCache::Middleware
Rack::Runtime
ActionDispatch::RequestId
ActionDispatch::RemoteIp
Rails::Rack::Logger
ActionDispatch::ShowExceptions
ActionDispatch::DebugExceptions
ActionDispatch::ActionableExceptions
ActionDispatch::Reloader
ActionDispatch::Callbacks
ActiveRecord::Migration::CheckPending
Rack::Head
Rack::ConditionalGet
Rack::ETag

#to get a list of middleware
bin/rails middleware


#Using cache middleware
def show
  @post = Post.find(params[:id])

  if stale?(last_modified: @post.updated_at)
    render json: @post
  end
end

#to enable cross-client caching
def show
  @post = Post.find(params[:id])

  if stale?(last_modified: @post.updated_at, public: true)
    render json: @post
  end
end

#using Rack::Sendfile
#Rack::Sendfile is responsible for sending the file
# Apache and lighttpd
config.action_dispatch.x_sendfile_header = "X-Sendfile"

# Nginx
config.action_dispatch.x_sendfile_header = "X-Accel-Redirect"


#using ActionDispatch::Request
#it will take parameters from the client in the JSON format and make available in controller inside params
jQuery.ajax({
  type: 'POST',
  url: '/people',
  dataType: 'json',
  contentType: 'application/json',
  data: JSON.stringify({ person: { firstName: "Yehuda", lastName: "Katz" } }),
  success: function(json) { }
});

{ :person => { :firstName => "Yehuda", :lastName => "Katz" } }


#using Session Middleware
# This also configures session_options for use below
config.session_store :cookie_store, key: '_interslice_session'

# Required for all session management (regardless of session_store)
config.middleware.use ActionDispatch::Cookies

config.middleware.use config.session_store, config.session_options


#removing Middleware
config.middleware.delete ::Rack::Sendfile
