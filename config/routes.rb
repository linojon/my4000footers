Rails.application.routes.draw do

  resources :links

  get 'signin', to: redirect('/auth/facebook'), as: :signin
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  match 'auth/hack', to: 'sessions#hack', via: :get
  get 'who', to: 'sessions#who'
  get 'iam', to: 'sessions#iam'
  
  resources :trips do
    resources :hikers, only: [:create]
  end
  
  match 'newsfeed', to: 'trips#index', as: :newsfeed, via: :get

  resources :hikers

  resources :mountains

  mount Attachinary::Engine => "/attachinary"

  root 'pages#home'

  match 'legalese', to: 'pages#legalese', as: :legalese, via: :get
  match 'test_email', to: 'pages#test_email', as: :test_email, via: :get

end
