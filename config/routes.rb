# frozen_string_literal: true

Rails.application.routes.draw do
  # resources :comments
  resources :reports do 
    resources :comments
  end
  resources :books do
    resources :comments
  end
  resource :user, only: [:show]
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations"
  }
  root to: "books#index"
end
