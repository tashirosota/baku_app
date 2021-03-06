# rubocop:disable all
Rails.application.routes.draw do
  get 'login', to: 'client/sessions#new'
  post 'login', to: 'client/sessions#create'
  get 'logout', to: 'client/sessions#destroy'
  root 'client/home#index'

  # client側route(pathにclientは含めないこと)
  get 'calender', to: 'client/calenders#index'
  resources :events, controller: 'client/events'
  resources :artists, controller: 'client/artists'
  resources :collaborators, controller: 'client/collaborators'
  resource :eventer, controller: 'client/eventer'
  resources :offers, controller: 'client/offer'

  # admin側route
  namespace :admin do
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    get 'logout', to: 'sessions#destroy'

    root 'dashboard#index'
    get 'dashboard', to: 'dashboard#index'

    get 'events', to: 'events#index'
    get 'events/:id', to: 'events#show', as: 'event'

    get 'eventers', to: 'eventers#index'
    get 'eventers/:id', to: 'eventers#show', as: 'eventer'

    get 'offers', to: 'offers#index'

    get 'friends', to: 'friends#index'

    get 'artists', to: 'artists#index'
    get 'artists/:id', to: 'artists#show', as: 'artist'

    get 'collaborators', to: 'collaborators#index'
    get 'collaborators/:id', to: 'collaborators#show', as: 'collaborator'

    resources :administrators

    get 'password', to: 'password#edit'
    patch 'password', to: 'password#update'
  end
end
