Rails.application.routes.draw do
  root "home#index"
  get "/home", to: "home#index"
  get "/favours/new", to: "favours#new"
  post "/favours/new", to: "favours#create"
  resources :articles
  resources :news
  resources :about
  resources :reviews
  resources :questions
  resources :favours
end
