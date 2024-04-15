Rails.application.routes.draw do
  devise_for :users
  use_doorkeeper

  scope "auth" do 
    post "/signup",  to: "auth#signup"
    post "/login",  to: "auth#login"
  end

  namespace :api do
    resources :verticals do
      resources :categories, only: [:create, :update, :index] do
        resources :courses, only: [:create, :update, :index]
      end
    end
    get '/search', to: 'search#search'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
