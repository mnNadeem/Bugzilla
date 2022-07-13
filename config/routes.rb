# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
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
  root 'projects#index'
end
