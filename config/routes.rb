Rails.application.routes.draw do
  devise_for :users
  root to: 'prospects#index'
  resources :prospects, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :orders, only: [:new, :create]
  end
  resources :orders,   only: [:index, :edit, :update, :destroy]
  resources :clients,  only: [:index, :new, :create, :edit, :update, :destroy]
  resources :services, only: [:index, :new, :create, :edit, :update, :destroy]
end
