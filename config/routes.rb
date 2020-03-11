Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products do
    resources :transactions, only: [:new, :create, :update]
  end
  resources :users, only: :show do
    resources :cards, only: [:show, :new, :create, :destroy]
  end

  
end
