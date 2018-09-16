Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'client/dashboard#index'
  get 'login', to: 'client/sessions#new'
  get 'logout', to: 'client/sessions#destroy'

  #client側route(pathにclientは含めないこと)
  namespace :client do
    resources :events, path: 'events'
    resources :artists, path: 'artists'
    resources :friends, path: 'friends'
    resources :collaborators, path: 'collaborators'
    resources :offers, path: 'offers'
    resource :eventer, path: 'eventer'
  end

  #admin側route
  namespace :admin do
    get 'login', to: 'sessions#new'
    get 'logout', to: 'sessions#destroy'

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

    get 'administrators', to: 'administrators#index'
    get 'administrators/:id', to: 'administrators#show'

    resource :password
  end
end
