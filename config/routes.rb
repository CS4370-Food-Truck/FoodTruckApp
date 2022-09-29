Rails.application.routes.draw do
  resources :trucks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "trucks#index"
end
