Rails.application.routes.draw do
  devise_for :users
  use_doorkeeper

  scope "auth" do 
    post "/signup",  to: "auth#signup"
    post "/login",  to: "auth#login"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
