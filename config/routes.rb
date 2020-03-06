Rails.application.routes.draw do
  root "products#index"
  resources :products
  resources :transactions, only: :new
  resources :users, only: :show
end
