# frozen_string_literal: true

Rails.application.routes.draw do
  resource :users, only: [:show]
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations"
  }
  resources :books
  root to: "books#index"
end
