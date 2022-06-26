Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resource :profile
  
  resources :tasks

  namespace :admin do
    resources :notifications
  end
end
