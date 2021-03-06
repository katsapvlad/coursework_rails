Rails.application.routes.draw do
  root 'home#index'
  get '/home', to: 'home#index'

  post '/favours/new', to: 'favours#create'
  post '/articles/new', to: 'articles#create'
  post '/news/new', to: 'news#create'
  post '/questions/new', to: 'questions#create'
  post '/favours/:id', to: 'orders#create'
  get 'success', to: 'success#index'
  get 'success_order', to: 'success_order#index'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'admins_sign_up', to: 'admins_registrations#new'
  post 'admins_sign_up', to: 'admins_registrations#create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'

  get 'manage', to: 'manage#index'
  get 'manage/favours_delete', to: 'manage#favours_delete'
  get 'manage/articles_delete', to: 'manage#articles_delete'
  get 'manage/news_delete', to: 'manage#news_delete'
  post 'manage/favours_delete', to: 'favours#destroy'
  post 'manage/articles_delete', to: 'articles#destroy'
  post 'manage/news_delete', to: 'news#destroy'

  post 'news_comments', to: 'news_comments#create'
  post 'article_comments', to: 'article_comments#create'

  delete 'logout', to: 'sessions#destroy'
  resources :articles
  resources :orders
  resources :news
  resources :about
  resources :reviews
  resources :questions
  resources :favours
  resources :users
end
