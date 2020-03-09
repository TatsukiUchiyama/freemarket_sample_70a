Rails.application.routes.draw do
   devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
  end

  resources :users, only:[:new, :create]

  root "products#index"
  resources :products
  resources :transactions, only: :new
end
