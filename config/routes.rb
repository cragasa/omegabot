# frozen_string_literal: true

Rails.application.routes.draw do
  resources :pages
  resources :line_items
  resources :carts

  get 'static/:permalink', to: 'pages#static', as: 'static'

  devise_for :customers
  get 'search_results', to: 'search#results', as: 'search_results'
  root to: 'products#index'
  resources :products, only: %i[index show]
  resources :categories, only: %i[index show]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
