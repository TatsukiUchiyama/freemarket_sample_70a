Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products do
    resources :transactions, only: [:new, :create, :update, :destroy]
  end
  resources :users, only: :show do
    resources :cards, only: [:new, :create]
  end

  
end
