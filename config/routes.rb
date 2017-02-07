Rails.application.routes.draw do

  resources :products

  root "products#index"

  resources :users, only: [:new, :create]
end
