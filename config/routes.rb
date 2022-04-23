Rails.application.routes.draw do
  devise_for :users
  root to: 'prospects#index'
  resources :prospects
end
