Rails.application.routes.draw do
  resources :transactions, only: :new
end
