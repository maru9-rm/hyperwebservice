Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resource :profile
  
  resources :tasks

  resources :rooms

  namespace :admin do
    resources :notifications
  end


end
