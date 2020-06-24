# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :users do
    member do
      get :hovercard
      get :past_events
      get :live_events
    end
  end
  resources :events
end
