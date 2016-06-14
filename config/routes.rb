Rails.application.routes.draw do
  root to: "users#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users, only: [:show]
  resources :links, only: [:create]
end
