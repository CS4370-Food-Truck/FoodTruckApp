Rails.application.routes.draw do
  resources :trucks
  
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
  resources :users, except: [:new]
  post "/save-subscription", to: "notifications#subscribe"
  post "/add-subscription", to: "notifications#subtruck"
  post "/remove-subscription", to: "notifications#unsubtruck"
  post "/unsubscribe", to: "notifications#unsubscribe"
  get "/notify", to: "notifications#notify"

end
