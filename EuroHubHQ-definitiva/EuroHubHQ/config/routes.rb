Rails.application.routes.draw do
  devise_for :handlers, :controllers => {:omniauth_callbacks => "handlers/omniauth_callbacks"}
  namespace :admin do
    resources :matches
    resources :orders
    resources :products do
      resources :stocks
    end
      resources :categories
  end
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  authenticated :admin_user do
    root to: "admin#index", as: :admin_root
  end

  authenticated :handler do
    root to: "handler#index", as: :handler_root
  end


  root to: "games#index", as: :game_user
  

  resources :categories, only: [:show]
  resources :products, only: [:show]
  resources :matches

  get "admin" => "admin#index"
  get "cart" => "carts#show"
  get "shop" => "shop#index"
  get "handler" => "handler#index"
  get "handler/show" => "handler#show"
  get "matches"=> "matches#index"
  get "groups"=>"groups#index"
  post "checkout" => "checkouts#create"
  get "success" => "checkouts#success"
  get "cancel" => "checkouts#cancel"
  post "webhooks" => "webhooks#stripe"
  post "/" => "webhooks#stripe"
  get "games" => "games#index"


end