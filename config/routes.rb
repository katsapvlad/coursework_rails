Rails.application.routes.draw do
  root "home#index"
  get "/home", to: "home#index"
  get "/favours", to: "favours#index"
  get "/favours/new", to: "favours#new"
  get "/favours/:id", to: "favours#show"
  post "/favours/new", to: "favours#create"

  get "/articles/new", to: "articles#new"
  get "/articles/:id", to: "articles#show"
  post "/articles/new", to: "articles#create"

  get "/news/new", to: "news#new"
  get "/news/:id", to: "news#show"
  post "/news/new", to: "news#create"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "admins_sign_up", to: "admins_registrations#new"
  post "admins_sign_up", to: "admins_registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "manage", to: "manage#index"
  get "manage/favours_delete", to: "manage#favours_delete"
  get "manage/articles_delete", to: "manage#articles_delete"
  get "manage/news_delete", to: "manage#news_delete"
  post "manage/favours_delete", to: "favours#destroy"
  post "manage/articles_delete", to: "articles#destroy"
  post "manage/news_delete", to: "news#destroy"

  delete "logout", to: "sessions#destroy"
  resources :articles
  resources :news
  resources :about
  resources :reviews
  resources :questions
  resources :favours
  resources :users
end
