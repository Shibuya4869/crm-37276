Rails.application.routes.draw do
  devise_for :users
  root to: 'prospects#index'
  resources :prospects, only: [:index, :new, :create, :edit, :update] do
    resources :orders, only: [:new, :create]
  end
  resources :orders,   only: [:index, :edit, :update]
  resources :clients,  only: [:index, :new, :create, :edit, :update]
  resources :services, only: [:index, :new, :create, :edit, :update]
end
