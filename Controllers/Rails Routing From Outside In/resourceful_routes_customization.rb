#Customizing resourceful routes

#Specifying controller to use
resources :photos, controller: 'images'

#Specifying constraints
resources :photos, constraints: { id: /[A-Z][A-Z][0-9]+/ }
#it would not accept :id as 1 instead it would accept RR27
constraints(id: /[A-Z][A-Z][0-9]+/) do
    resources :photos
    resources :accounts
end
#contraints to more than one routes

#Overriding the new and edit Segments
resources :photos, path_names: { new: 'make', edit: 'change' }
#it would recognize paths as
/photos/make
/photos/1/change

#Prefixing the Named Route Helpers
scope 'admin', as: 'admin' do
    resources :photos, :accounts
end
resources :photos, :accounts
#it will generate routes admin_photos_path and admin_accounts_path

#Restricting the Routes Created
resources :photos, only: [:index, :show]

resources :photos, except: :destroy

   