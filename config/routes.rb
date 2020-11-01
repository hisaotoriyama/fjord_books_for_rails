# frozen_string_literal: true

Rails.application.routes.draw do
  resources :reports
  resources :books
  resource :user, only: [:show]
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations"
  }
  root to: "books#index"
end
