# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "businesses#index"

  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  # The two get routes above and all the other basic CRUD routes get smushed into resources
  resources :articles do
    resources :comments
  end

  # STRIPE
  post 'checkout/create', to: 'checkouts#create'
  get 'checkout/success', to: 'checkouts#success'
  get 'checkout/cancel', to: 'checkouts#cancel'
  # Stripe webhooks
  post '/webhooks/stripe', to: 'webhooks#stripe'

  resources :businesses do
    get "analytics", on: :member # not referring to Member model, referring to business instance
    resources :sites do
      resources :visits
    end
    resources :employees
    resources :members
    resources :memberships
    resources :events
  end

  resources :users, only: %i[new create index show]
  resources :sessions, only: %i[new create destroy]
  delete "/logout", to: "sessions#destroy", as: :logout
end
