Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  namespace :admin do
    resource :dashboard, only: [:show]
    resources :albums
    resources :playlists
  end

  namespace :superadmin do
    resources :albums
    resources :playlists
  end

  resource :about, only: [:show]
  resource :contact, only: [:show]
  resource :session, only: [:new, :create, :destroy]
  get '/signup', to: 'users#new'
  resources :users
  resources :songs
  resources :albums
  resources :playlists
  resources :lists, only: [:index, :new, :create]

end
