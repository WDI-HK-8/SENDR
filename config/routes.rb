Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  root 'static_pages#index'
  resources :emails

  get 'scheduled',  to: 'emails#scheduled'
  get 'log',        to: 'emails#log'


end
