#Choosing controller modules
#An API application comes with these controller modules by default
ActionController::UrlFor: Makes url_for and similar helpers available.
ActionController::Redirecting: Support for redirect_to.
AbstractController::Rendering and ActionController::ApiRendering: Basic support for rendering.
ActionController::Renderers::All: Support for render :json and friends.
ActionController::ConditionalGet: Support for stale?.
ActionController::BasicImplicitRender: Makes sure to return an empty response, if there isn't an explicit one.
ActionController::StrongParameters: Support for parameters filtering in combination with Active Model mass assignment.
ActionController::DataStreaming: Support for send_file and send_data.
AbstractController::Callbacks: Support for before_action and similar helpers.
ActionController::Rescue: Support for rescue_from.
ActionController::Instrumentation: Support for the instrumentation hooks defined by Action Controller (see the instrumentation guide for more information regarding this).
ActionController::ParamsWrapper: Wraps the parameters hash into a nested hash, so that you don't have to specify root elements sending POST requests for instance.
ActionController::Head: Support for returning a response with no content, only headers.

#Adding other modules
class ApplicationController < ActionController::API
  include ::ActionController::Caching
  self.cache_store = :mem_cache_store
end
#use include alongwith the module to include it in our controller