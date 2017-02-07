Rails.application.routes.draw do

  resources :products
  root "products#index"

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]
end
