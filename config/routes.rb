Rails.application.routes.draw do
  root to: "users#index"

  resources :users, only: [:new, :create, :index]
  resources :passwords
  resource :password
  resource :session, only: [:new, :create, :delete]

  get "/sign_up", to: "users#new", as: "sign_up"
  delete "/sign_out", to: "sessions#destroy", as: "sign_out"
  get "/sign_in", to: "sessions#new", as: "sign_in"
end
