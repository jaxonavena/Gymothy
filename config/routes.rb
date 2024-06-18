Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "articles#index"

  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  # The two get routes above and all the other basic CRUD routes get smushed into resources
  resources :articles do
    resources :comments
  end

  resources :businesses
  
  resources :sites
end
