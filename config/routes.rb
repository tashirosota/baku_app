# rubocop:disable all
Rails.application.routes.draw do
  root 'client/dashboard#index'
  get 'login', to: 'client/sessions#new'
  post 'login', to: 'client/sessions#create'
  get 'logout', to: 'client/sessions#destroy'

  # client側route(pathにclientは含めないこと)
  resources :events, controller: 'client/events'
  resources :artists, controller: 'client/artists'
  resources :friends, controller: 'client/friends'
  resources :collaborators, controller: 'client/collaborators'
  resources :offers, controller: 'client/offers'
  resource :eventer, controller: 'client/eventer'

  # admin側route
  namespace :admin do
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    get 'logout', to: 'sessions#destroy'

    root 'dashboard#index'
    get 'dashboard', to: 'dashboard#index'

    get 'events', to: 'events#index'
    get 'events/:id', to: 'events#show'

    get 'eventers', to: 'eventers#index'
    get 'eventers/:id', to: 'eventers#show'

    get 'offers', to: 'offers#index'

    get 'friends', to: 'artists#index'

    get 'artists', to: 'artists#index'
    get 'artists/:id', to: 'artists#show'

    get 'collaborators', to: 'collaborators#index'
    get 'collaborators/:id', to: 'collaborators#show'

    resources :administrators

    get 'password', to: 'password#edit'
    post 'password', to: 'password#update'
  end
end
