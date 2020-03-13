Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products do
    collection do
      get 'category_children' 
      get 'category_grandchildren'
    end
    resources :transactions, only: [:new, :create, :update]
  end
  resources :users, only: :show do
    resources :cards, only: [:new, :create]
  end
end