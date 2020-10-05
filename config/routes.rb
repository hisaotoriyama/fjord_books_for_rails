# frozen_string_literal: true

Rails.application.routes.draw do
  get "users/show"
  devise_for :users, controllers: {
    registrations: "users/registrations"
}
  resources :books
  resources :users, only: [:show]
  root to: "books#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
