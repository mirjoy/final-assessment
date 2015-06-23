Rails.application.routes.draw do
  root "home#index"

  resources :sessions, only: [:new]
end
