# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  resources :bugs
  root to: 'home#index'
  resources :projects
  root 'projects#index'
  resources :projects do
    member do
      get :remove_qas
      get :remove_developers
    end
  end
  resources :bugs do
    member do
      get :assign_bug_to_developer
      get :resolve_bug
    end
  end
end
