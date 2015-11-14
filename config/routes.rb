Budgie::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'messages', to: 'conversations#index', as: 'messages'
  get 'favorites', to: 'favorites#index', as: 'favorites'
  resources :categories

  resources :companies do
    resources :users, :discounts
  end 

  resources :users do
    resources :companies, :discounts, :favorites
  end  

  resources :conversations do
    resources :messages
  end 


  resources :invitations

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]
  root to: 'users#index'

end
