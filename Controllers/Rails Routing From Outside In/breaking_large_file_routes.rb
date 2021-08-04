#Breaking up very large route file into multiple small ones

# config/routes.rb
Rails.application.routes.draw do
    get 'foo', to: 'foo#bar'
  
    draw(:admin) # Will load another route file located in `config/routes/admin.rb`
end

# config/routes/admin.rb
namespace :admin do
    resources :comments
end
#draw(:admin) will try to load same named file as its parameter

