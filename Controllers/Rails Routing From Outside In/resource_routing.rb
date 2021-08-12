# Resource Routing: the Rails Default 

DELETE  /photos/5

resources :photos  
# the destroy request would be dispatched to controller with { id; '5'}

#Path and Url Helpers

photos_path returns /photos
new_photo_path returns /photos/new
edit_photo_path(:id) returns /photos/:id/edit 
photo_path(:id) returns /photos/:id 

# We can define multiple resources at once
resources :photos, :books, :videos

#Singular Resource
get 'profile', to: 'users#show'
#when using symbol instead of to:
get 'profile', action: :show, controller: 'users'

#controller namespace and routing
namespace :admin do
    resources :articles, :comments
end
#it will create routes for each articles and comments under the app/controllers/admin directory

scope module: 'admin' do
    resources :articles, :comments
end
#using the scope block the route would be /articles without prefix /admin to Admin::ArticlesController

resources :articles, module: 'admin'
#for single route

scope '/admin' do
    resources :articles, :comments
end
#it would route /admin/articles to ArticlesController without Admin:: prefix

resources :articles, path: '/admin/articles'
#for singular route


#Nested Resources
#If our application has 
class Magazine < ApplicationRecord
    has_many :ads
end
  
class Ad < ApplicationRecord
    belongs_to :magazine
end
#we can capture this relation in our routing by
resources :magazines do
    resources :ads
end

#deep nesting
resources :publishers do
    resources :magazines do
      resources :photos
    end
end
#we can nest multiple routes like this but it becomes difficult to use as
/publishers/1/magazines/2/photos/3 #it would recognize paths like this


#one way to avoid deep nesting is shallow nesting
resources :articles do
    resources :comments, only: [:index, :new, :create]
  end
resources :comments, only: [:show, :edit, :update, :destroy]
#here we only build routes with minimal amount of information

resources :articles, shallow: true do
    resources :comments
    resources :quotes
    resources :drafts
end
#to shallow nested resources we have to use the :shallow option in parent resource
  
 
#Routing Concerns
concern :commentable do
    resources :comments
end
  
concern :image_attachable do
    resources :images, only: :index
end
#using concerns we can reuse common routes inside other resources 

resources :messages, concerns: :commentable

resources :articles, concerns: [:commentable, :image_attachable]
#it is equivalent to
resources :messages do
    resources :comments
end
  
resources :articles do
    resources :comments
    resources :images, only: :index
end


#Creating Paths And URLs from Object
resources :magazines do
    resources :ads
end
#we have set this routes

# <%= link_to 'Ad details', magazine_ad_path(@magazine, @ad) %>
#we can pass instances of magazines and ad

# <%= link_to 'Ad details', [@magazine, @ad] %>
# it will use the magazine_ad_path helper and link magazine and ad


#Adding More RESTful Actions

resources :photos do
    member do
      get 'preview'
    end
end
#it will add member route to resource block

resources :photos do
    collection do
      get 'search'
    end
end
#it will add a route to a collection

resources :comments do
    get 'preview', on: :new
end
#it will enable rails to recongize /comments/new/preview and route to preview of CommentsController

  
  
  

  

  
  