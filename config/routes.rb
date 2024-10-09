Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
  
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"
  
  get "/carted_products" => "carted_products#index"
  get "/carted_products/:id" => "carted_products#show"
  post "/carted_products" => "carted_products#create"
  patch "/carted_products/:id" => "carted_products#update"
  delete "/carted_products/:id" => "carted_products#destroy"
 
  get "suppliers" => "suppliers#index"
  get "suppliers/:id" => "suppliers#show"
  post "suppliers" => "suppliers#create"
  
   
  
  post "/images" => "images#create"
  patch "/images/:id" => "images#update"
  delete "/images/:id" => "images#destroy"



  get "/orders" => "orders#index"
  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"

  # Defines the root path route ("/")
  # root "posts#index"
end
