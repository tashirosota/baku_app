Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'client/dashboard#index'
  get 'login', to: 'client/sessions#new'
  post 'login', to: 'client/sessions#create'
  post 'logout', to: 'client/sessions#destroy'

  #client側route(pathにclientは含めないこと)
  resources :events, controller: 'client/events'
  resources :artists, controller: 'client/artists'
  resources :friends, controller: 'client/friends'
  resources :collaborators, controller: 'client/collaborators'
  resources :offers, controller: 'client/offers'
  resource :eventer, controller: 'client/eventer'

  #admin側route
  namespace :admin do
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    post 'logout', to: 'sessions#destroy'

    root 'dashboard#index'
    get 'dashboard', to: 'dashboard#index'

    get 'events', to: 'events#index'
    get 'events/:id', to: 'events#show'

    get 'users', to: 'users#index'
    get 'users/:id', to: 'users#show'

    get 'artists', to: 'artists#index'
    get 'artists/:id', to: 'artists#show'

    get 'collaborators', to: 'collaborators#index'
    get 'collaborators/:id', to: 'collaborators#show'

    resources :administrators

    post 'password', to: 'password#update'
  end
end
