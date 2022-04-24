Rails.application.routes.draw do
  devise_for :users
  root to: 'prospects#index'
  resources :prospects, only: [:index, :new, :create, :edit, :update]
  resources :orders,    only: [:index, :new, :create, :edit, :update]
  resources :clients,   only: [:index, :new, :create, :edit, :update]
  resources :services,  only: [:index, :new, :create, :edit, :update]
end
