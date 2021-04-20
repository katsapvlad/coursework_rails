Rails.application.routes.draw do
  root "home#index"
  get "/home", to: "home#index"
  get "/favours", to: "favours#index"
  get "/articles", to: "articles#index"
  get "/news", to: "news#index"
  get "/about", to: "about#index"
  get "/reviews", to: "reviews#index"
  get "/questions", to: "questions#index"
end
