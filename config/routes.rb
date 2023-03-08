Rails.application.routes.draw do
  root 'static_pages#home'
  get  "/about",   to: "static_pages#about"
  get '/signup'  => 'users#new'
  resources :users

  resources :recipes, only: %w[index show]
 end

