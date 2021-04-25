Rails.application.routes.draw do
  root "home#index"
  get "/home", to: "home#index"
  get "/favours/new", to: "favours#new"
  get "/favours/:id", to: "favours#show"
  post "/favours/new", to: "favours#create"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "admins_sign_up", to: "admins_registrations#new"
  post "admins_sign_up", to: "admins_registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "manage", to: "manage#index"
  get "manage/delete", to: "manage#delete"

  post "manage/delete", to: "favours#destroy"
  delete "logout", to: "sessions#destroy"
  resources :articles
  resources :news
  resources :about
  resources :reviews
  resources :questions
  resources :favours
  resources :users
end
