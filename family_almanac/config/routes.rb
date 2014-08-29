Rails.application.routes.draw do

  root :to => 'users#new'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'


  resources :users do
    resources :photos
  end
  resources :sessions, only: [:new, :create, :destroy]
end

#          Prefix Verb   URI Pattern                               Controller#Action
#          signup GET    /signup(.:format)                         users#new
#           login GET    /login(.:format)                          sessions#new
#          logout GET    /logout(.:format)                         sessions#destroy
#        sessions GET    /sessions(.:format)                       sessions#index
#                 POST   /sessions(.:format)                       sessions#create
#     new_session GET    /sessions/new(.:format)                   sessions#new
#    edit_session GET    /sessions/:id/edit(.:format)              sessions#edit
#         session GET    /sessions/:id(.:format)                   sessions#show
#                 PATCH  /sessions/:id(.:format)                   sessions#update
#                 PUT    /sessions/:id(.:format)                   sessions#update
#                 DELETE /sessions/:id(.:format)                   sessions#destroy
#     user_photos GET    /users/:user_id/photos(.:format)          photos#index
#                 POST   /users/:user_id/photos(.:format)          photos#create
#  new_user_photo GET    /users/:user_id/photos/new(.:format)      photos#new
# edit_user_photo GET    /users/:user_id/photos/:id/edit(.:format) photos#edit
#      user_photo GET    /users/:user_id/photos/:id(.:format)      photos#show
#                 PATCH  /users/:user_id/photos/:id(.:format)      photos#update
#                 PUT    /users/:user_id/photos/:id(.:format)      photos#update
#                 DELETE /users/:user_id/photos/:id(.:format)      photos#destroy
#           users GET    /users(.:format)                          users#index
#                 POST   /users(.:format)                          users#create
#        new_user GET    /users/new(.:format)                      users#new
#       edit_user GET    /users/:id/edit(.:format)                 users#edit
#            user GET    /users/:id(.:format)                      users#show
#                 PATCH  /users/:id(.:format)                      users#update
#                 PUT    /users/:id(.:format)                      users#update
#                 DELETE /users/:id(.:format)                      users#destroy
