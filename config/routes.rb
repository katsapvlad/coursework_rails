Rails.application.routes.draw do
  root "home#index"
  get "/home", to: "home#index"
  get "/favours", to: "favours#index"
  get "/favours/new", to: "favours#new"
  get "/favours/:id", to: "favours#show"
  get "/favours/delete", to: "favours#delete"
  post "/favours/new", to: "favours#create"
  post "/favours/delete", to: "favours#destroy"

  get "/articles/new", to: "articles#new"
  get "/articles/:id", to: "articles#show"
  post "/articles/new", to: "articles#create"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "admins_sign_up", to: "admins_registrations#new"
  post "admins_sign_up", to: "admins_registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "manage", to: "manage#index"
  get "manage/favours_delete", to: "manage#favours_delete"
  get "manage/articles_delete", to: "manage#articles_delete"
  post "manage/favours_delete", to: "favours#destroy"
  post "manage/articles_delete", to: "articles#destroy"

  delete "logout", to: "sessions#destroy"
  resources :articles
  resources :news
  resources :about
  resources :reviews
  resources :questions
  resources :favours
  resources :users
end
