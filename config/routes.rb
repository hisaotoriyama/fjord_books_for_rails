# frozen_string_literal: true

Rails.application.routes.draw do
  # resources :comments
  resources :reports do 
    resources :comments
  end
  resources :books do
    resources :comments
  end
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :books
  resources :users, only: %i[show index]
  resources :users do
    get :follower, on: :member
    get :following, on: :member
  end
  root to: 'books#index'
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
end
