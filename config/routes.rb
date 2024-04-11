Rails.application.routes.draw do
  devise_for :users
  use_doorkeeper

  scope "auth" do 
    post "/signup",  to: "auth#signup"
    post "/login",  to: "auth#login"
  end

  resources :verticals do
    resources :categories, only: [:create, :update, :index] do
      resources :courses, only: [:create, :update, :index]
    end
  end

  # Additional routes for direct access to categories and courses if needed
  resources :categories, only: [:show, :destroy] do
    resources :courses, only: [:show, :destroy]
  end

  # Routes for courses that can be accessed directly
  resources :courses, only: [:show, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
