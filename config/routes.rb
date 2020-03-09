Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products
  resources :transactions, only: [:new, :show, :edit, :destroy]
end
