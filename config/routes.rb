Rails.application.routes.draw do
  devise_for :users
  root to: 'prospects#index'
  resources :prospects, only: [:index, :new, :create]
  resources :clients,   only: [:index, :new, :create]
  resources :services,  only: [:index, :new, :create]
end
