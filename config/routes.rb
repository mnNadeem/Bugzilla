Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  # get 'users', to: 'users#index', as:'users'
  resources :users, only: :index
  root to: "home#index"
  resources :projects
  root 'projects#index'
  resources :projects do
    member do
      get :add_qas_developers
      get :remove_qas_developers
    end
  end
end
