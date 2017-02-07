Rails.application.routes.draw do

  resources :products do
    resources :reviews, only: [:show, :create, :destroy]
  end
  root "products#index"

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]
end
