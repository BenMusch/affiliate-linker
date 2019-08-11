Rails.application.routes.draw do
  mount API::Base, at: "/"

  root to: "links#index"

  resources :users, only: [:new, :create]
  resources :passwords
  resource :password
  resource :session, only: [:new, :create, :delete]
  resources :links, only: [:new, :create, :index]

  get "/sign_up", to: "users#new", as: "sign_up"
  delete "/sign_out", to: "sessions#destroy", as: "sign_out"
  get "/sign_in", to: "sessions#new", as: "sign_in"
end
