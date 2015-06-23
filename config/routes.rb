Rails.application.routes.draw do
  root "home#index"

  resources :sessions, only: [:new]
  resources :pairs, only: [:index]
end
