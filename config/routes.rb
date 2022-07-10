Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  
  root to: 'home#index'

  resource :profile
  
  resources :tasks

  resources :rooms

  namespace :admin do
    resources :notifications
  end


end
