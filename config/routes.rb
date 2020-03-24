Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products do
    collection do
      get 'category' 
      get 'category_children' 
      get 'category_grandchildren'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :transactions, only: [:new, :create, :update, :destroy]
  end
  resources :users, only: :show do
    resources :cards, only: [:new, :create, :destroy]
    member do
      get 'card'
    end
  end
  resources :categories, only: :show
end