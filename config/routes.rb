Rails.application.routes.draw do
  root "contacts#index"

  resources :contacts, only: [:index, :show, :create, :update, :destroy]
  resources :companies, only: [:show]
end
