# Non-Resourceful Routes

#Bound Parameters
get 'photos(/:id)', to: 'photos#display'
#if request is for /photos/1 then display action of PhotosController would be invoked and "1" would be made final parameter

#Dynamic Segments
get 'photos/:id/:user_id', to: 'photos#show'
#/photos/1/2 will be dispatched to show action and params[:id] = "1" and params[:user_id] = "2"

#Static Segments
get 'photos/:id/with_user/:user_id', to: 'photos#show'
#it would respond to /photos/1/with_user/2 and params would be { controller: 'photos', action: 'show', id: '1', user_id: '2' }

#Query String
get 'photos/:id', to: 'photos#show'

#Defining Defaults
get 'photos/:id', to: 'photos#show', defaults: { format: 'jpg' }
#it would match photos/5 to show action and set params[:format] to "jpg"

#Naming routes
get 'exit', to: 'sessions#destroy', as: :logout
#it will create logout_path and logout_url

#Http Verb Constraints
match 'photos', to: 'photos#show', via: [:get, :post]
#can be replaced to
match 'photos', to: 'photos#show', via: :all


#Route Globbing and Wildcard Segments
get 'photos/*other', to: 'photos#unknown'
#it would match photos/12 to /photos/long/path/12
#segments with * prefix are called wildcard segments

get '*a/foo/*b', to: 'test#index'
#it would match zoo/woo/foo/bar/baz where params[:a] = 'zoo/woo' and params[:b] = 'bar/baz'.

#Redirection
get '/stories/:name', to: redirect('/articles/%{name}')
#we can redirect to any path by using redirect

#Using root
root to: 'pages#main'
root 'pages#main' # shortcut for the above

#Unicode Character Routes
get 'こんにちは', to: 'welcome#index'

#Direct Routes
direct :homepage do
    "http://www.rubyonrails.org"
end
# >> homepage_url
# => "http://www.rubyonrails.org"

#Resolve
#it allows customizing polymorphic mapping of models
resource :basket
resolve("Basket") { [:basket] }

#<%= form_with model: @basket do |form| %>
#    <!-- basket form -->
#<% end %>

#It will generate the singular URL /basket instead of the usual /baskets/:id
