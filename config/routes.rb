Rails.application.routes.draw do
  resources :trucks
  resources :users, except: [:new]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "map#index"

  get "/trucks-simple", to: "trucks#simple"
  get "/trucks-delete", to: "trucks#destroyall"
  get "/map", to: "map#index"


  # Session routes
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
end
