Rails.application.routes.draw do
  root "home#index"
  get "/home", to: "home#index"
  get "/favours/new", to: "favours#new"
  post "/favours/new", to: "favours#create"
  # post "/users/create", to: "users#create"
  # post "/users/login", to: "users#new"
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"
  resources :articles
  resources :news
  resources :about
  resources :reviews
  resources :questions
  resources :favours
  resources :users
end
