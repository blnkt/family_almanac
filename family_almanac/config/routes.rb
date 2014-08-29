Rails.application.routes.draw do

  root :to => 'users#new'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'


  resources :users, except: [:edit, :update] do
    resources :photos, except: [:edit, :update] do
      resources :tags, only: [:create, :destroy]
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
end


#          Prefix Verb   URI Pattern                                         Controller#Action
#            root GET    /                                                   users#new
#          signup GET    /signup(.:format)                                   users#new
#           login GET    /login(.:format)                                    sessions#new
#          logout GET    /logout(.:format)                                   sessions#destroy
# user_photo_tags POST   /users/:user_id/photos/:photo_id/tags(.:format)     tags#create
#  user_photo_tag DELETE /users/:user_id/photos/:photo_id/tags/:id(.:format) tags#destroy
#     user_photos GET    /users/:user_id/photos(.:format)                    photos#index
#                 POST   /users/:user_id/photos(.:format)                    photos#create
#  new_user_photo GET    /users/:user_id/photos/new(.:format)                photos#new
#      user_photo GET    /users/:user_id/photos/:id(.:format)                photos#show
#                 DELETE /users/:user_id/photos/:id(.:format)                photos#destroy
#           users GET    /users(.:format)                                    users#index
#                 POST   /users(.:format)                                    users#create
#        new_user GET    /users/new(.:format)                                users#new
#            user GET    /users/:id(.:format)                                users#show
#                 DELETE /users/:id(.:format)                                users#destroy
#        sessions POST   /sessions(.:format)                                 sessions#create
#     new_session GET    /sessions/new(.:format)                             sessions#new
#         session DELETE /sessions/:id(.:format)                             sessions#destroy
