Rails.application.routes.draw do
  get 'bugs/index'
  get 'bugs/create'
  get 'bugs/edit'
  get 'bugs/update'
  get 'bugs/destroy'
  get 'users/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  # # get 'users', to: 'users#index', as:'users'
  # resources :users, only: :index
  resources :bugs
  root to: "home#index"
  resources :projects
  root 'projects#index'
  resources :projects do
    member do
      get :add_qas_developers
      get :remove_qas_developers
      get :remove_qas_developers1
    end
  end
end