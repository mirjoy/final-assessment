Rails.application.routes.draw do
  root "home#index"

  get '/auth/:provider/callback', to: 'sessions#create'
  resources :sessions, only: [:destroy]
  resources :relationships, only: [:index, :create, :destroy]
  resources :users, only: [:show, :update, :edit]
end
